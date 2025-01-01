part of 'auth_provider.dart';

enum AuthStatus { initial, authenticated, unauthenticated }

class AuthState extends BaseState {
  AuthState({
    this.authStatus = AuthStatus.initial,
    this.user,
    this.googleUser,
    super.baseStatus,
    super.error,
  });
  AuthStatus authStatus;
  UserModel? user;
  GoogleSignInAccount? googleUser;

  @override
  AuthState copyWith({
    String? error,
    BaseStatus? status,
    AuthStatus? authStatus,
    UserModel? user,
    GoogleSignInAccount? googleUser,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      user: user ?? this.user,
      googleUser: googleUser ?? this.googleUser,
      baseStatus: status ?? baseStatus,
      error: error ?? this.error,
    );
  }
}
