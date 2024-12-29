import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smoney/core/common/common.export.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

part 'auth_state.dart';

final authProvider =
    NotifierProvider<AuthProvider, AuthState>(AuthProvider.new);

class AuthProvider extends Notifier<AuthState> {
  @override
  build() {
    return AuthState();
  }

  Future<void> googleSignIn() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      serverClientId: serverClientId,
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final googleUser = await googleSignIn.signIn();
    final googleAuth = await googleUser!.authentication;
    final accessToken = googleAuth.accessToken;
    final idToken = googleAuth.idToken;

    if (accessToken == null) {
      throw 'No Access Token found.';
    }
    if (idToken == null) {
      throw 'No ID Token found.';
    }
    final res = await supabase.Supabase.instance.client.auth.signInWithIdToken(
      provider: supabase.OAuthProvider.google,
      idToken: idToken,
      accessToken: accessToken,
    );
    print(res.user);
  }
}
