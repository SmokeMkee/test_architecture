import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    @Default(AuthStatus.unauthorized()) AuthStatus status,
    String? errorMessage,
  }) = _AuthState;
}

@freezed
sealed class AuthStatus with _$AuthStatus {
  const factory AuthStatus.unauthorized() = AuthStatusUnauthorized;

  const factory AuthStatus.authorized() = AuthStatusAuthorized;
}
