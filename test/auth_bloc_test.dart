import 'package:flutter_test/flutter_test.dart';
import 'package:test_architecture/src/common/config/logging/app_logger.dart';
import 'package:test_architecture/src/common/config/services/session_service.dart';
import 'package:test_architecture/src/features/auth/data/services/auth_service.dart';
import 'package:test_architecture/src/features/auth/domain/use_cases/get_auth_status_use_case.dart';
import 'package:test_architecture/src/features/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:test_architecture/src/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_bloc.dart';
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_event.dart';
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_state.dart';

class _FakeLogger implements AppLogger {
  final List<String> events = [];

  @override
  void logBusinessEvent(
    String eventName, {
    Map<String, Object?> payload = const {},
  }) {
    events.add('$eventName:$payload');
  }

  @override
  void logError(
    Object error, {
    StackTrace? stackTrace,
    String? reason,
    bool fatal = false,
  }) {}
}

void main() {
  test('auth bloc authorizes with valid credentials', () async {
    final logger = _FakeLogger();
    final behavior = AuthService(SessionService(), logger);
    final bloc = AuthBloc(
      GetAuthStatusUseCase(behavior),
      SignInUseCase(behavior),
      SignOutUseCase(behavior),
    );
    final emitted = <AuthState>[];
    final subscription = bloc.stream.listen(emitted.add);

    bloc.add(
      SignInRequested(
        login: 'test',
        password: '123',
      ),
    );
    await Future<void>.delayed(Duration.zero);

    expect(emitted.last.status, const AuthStatus.authorized());
    expect(logger.events.any((event) => event.contains('user_sign_in')), isTrue);

    bloc.add(SignOutRequested());
    await Future<void>.delayed(Duration.zero);
    expect(emitted.last.status, const AuthStatus.unauthorized());

    await subscription.cancel();
    await bloc.close();
  });

  test('auth bloc keeps unauthorized for invalid credentials', () async {
    final logger = _FakeLogger();
    final behavior = AuthService(SessionService(), logger);
    final bloc = AuthBloc(
      GetAuthStatusUseCase(behavior),
      SignInUseCase(behavior),
      SignOutUseCase(behavior),
    );
    final emitted = <AuthState>[];
    final subscription = bloc.stream.listen(emitted.add);

    bloc.add(
      SignInRequested(
        login: 'wrong',
        password: 'credentials',
      ),
    );
    await Future<void>.delayed(Duration.zero);

    expect(emitted.last.status, const AuthStatus.unauthorized());
    expect(emitted.last.errorMessage, isNotNull);
    expect(
      logger.events.any((event) => event.contains('user_sign_in_failed')),
      isTrue,
    );

    await subscription.cancel();
    await bloc.close();
  });
}
