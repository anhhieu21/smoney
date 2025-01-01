import 'package:google_sign_in/google_sign_in.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:smoney/features/base/base_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

part 'auth_state.dart';
part 'auth_provider.g.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  serverClientId: serverClientId,
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  AuthState build() {
    final currentUser = supabase.Supabase.instance.client.auth.currentUser;
    final googleUser = _googleSignIn.currentUser;
    return AuthState(
      authStatus: currentUser != null
          ? AuthStatus.authenticated
          : AuthStatus.unauthenticated,
      user: currentUser,
      googleUser: googleUser,
    );
  }

  Future<void> googleSignIn() async {
    final googleUser = await _googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
      throw 'No ID Token found.';
    }
    final res = await supabase.Supabase.instance.client.auth.signInWithIdToken(
      provider: supabase.OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    if (res.user != null) {
      state = state.copyWith(
        authStatus: AuthStatus.authenticated,
        user: res.user,
      );
    } else {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
    }
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await supabase.Supabase.instance.client.auth.signOut();
    state = AuthState(
      authStatus: AuthStatus.unauthenticated,
      user: null,
      googleUser: null,
    );
    return;
  }
}
