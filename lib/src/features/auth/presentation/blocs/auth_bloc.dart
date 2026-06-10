import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/domain/models/callable.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/auth/domain/use_cases/get_auth_status_use_case.dart';
import 'package:test_architecture/src/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:test_architecture/src/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_event.dart';
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._getAuthStatusUseCase,
    this._signInUseCase,
    this._signOutUseCase,
  ) : super(const AuthState()) {
    on<LoadAuthStatus>(_onLoadAuthStatus);
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);
    add(LoadAuthStatus());
  }

  final GetAuthStatusUseCase _getAuthStatusUseCase;
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUseCase;

  Future<void> _onLoadAuthStatus(
    LoadAuthStatus event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _getAuthStatusUseCase(const NoParams());
    final isAuthorized = result.value ?? false;
    emit(
      AuthState(
        status: isAuthorized
            ? const AuthStatus.authorized()
            : const AuthStatus.unauthorized(),
        errorMessage: null,
      ),
    );
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signInUseCase(
      (
        login: event.login,
        password: event.password,
      ),
    );
    if ((result.value ?? false) == true) {
      emit(
        const AuthState(
          status: AuthStatus.authorized(),
          errorMessage: null,
        ),
      );
      return;
    }
    emit(
      AuthState(
        status: const AuthStatus.unauthorized(),
        errorMessage: result.failure?.message ?? 'Ошибка авторизации',
      ),
    );
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signOutUseCase(const NoParams());
    if ((result.value ?? true) == false) {
      emit(
        const AuthState(
          status: AuthStatus.unauthorized(),
          errorMessage: null,
        ),
      );
    }
  }
}
