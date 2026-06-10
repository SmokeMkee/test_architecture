import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/config/logging/app_logger.dart';
import 'package:test_architecture/src/common/config/services/session_service.dart';
import 'package:test_architecture/src/common/domain/failures/failure.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/auth/domain/behaviors/auth_behavior.dart';

@lazySingleton
class AuthService implements AuthBehavior {
  AuthService(
    this._sessionService,
    this._logger,
  );

  final SessionService _sessionService;
  final AppLogger _logger;

  @override
  Future<Result<bool>> getAuthStatus() async {
    return SuccessResult(_sessionService.isAuthorized);
  }

  @override
  Future<Result<bool>> signIn({
    required String login,
    required String password,
  }) async {
    if (login != 'test' || password != '123') {
      _logger.logBusinessEvent(
        'user_sign_in_failed',
        payload: {'reason': 'invalid_credentials'},
      );
      return ErrorResult(
        OtherFailure(message: 'Неверный логин или пароль'),
      );
    }

    _sessionService.signIn();
    _logger.logBusinessEvent(
      'user_sign_in',
      payload: const {'source': 'auth_service', 'login': 'test'},
    );
    return SuccessResult(true);
  }

  @override
  Future<Result<bool>> signOut() async {
    _sessionService.signOut();
    _logger.logBusinessEvent(
      'user_sign_out',
      payload: const {'source': 'auth_service'},
    );
    return SuccessResult(false);
  }
}
