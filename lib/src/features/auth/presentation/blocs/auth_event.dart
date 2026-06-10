sealed class AuthEvent {}

class LoadAuthStatus extends AuthEvent {}

class SignInRequested extends AuthEvent {
  final String login;
  final String password;

  SignInRequested({
    required this.login,
    required this.password,
  });
}

class SignOutRequested extends AuthEvent {}
