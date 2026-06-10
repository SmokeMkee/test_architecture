import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:test_architecture/src/common/config/injector.dart';
import 'package:test_architecture/src/common/config/logging/app_logger.dart';
import 'package:test_architecture/src/common/config/services/session_service.dart';
import 'package:test_architecture/src/common/domain/models/lifecycle_probe.dart';

void main() {
  setUp(() async {
    await GetIt.instance.reset();
    await configureDependencies();
  });

  test('singleton lifecycle returns same instance', () {
    final first = GetIt.instance<SingletonProbeService>();
    final second = GetIt.instance<SingletonProbeService>();

    expect(identical(first, second), isTrue);
  });

  test('factory lifecycle returns new instance', () {
    final first = GetIt.instance<FactoryProbeService>();
    final second = GetIt.instance<FactoryProbeService>();

    expect(identical(first, second), isFalse);
    expect(first.id, isNot(equals(second.id)));
  });

  test('new core services are injectable', () {
    final session = GetIt.instance<SessionService>();
    final logger = GetIt.instance<AppLogger>();

    expect(session.isAuthorized, isFalse);
    expect(logger, isNotNull);
  });
}
