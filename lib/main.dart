import 'dart:async';
import 'dart:developer' as developer;

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:test_architecture/src/common/presentation/app.dart';
import 'package:test_architecture/src/features/async_lab/data/services/stream.dart';

import 'src/common/config/logging/app_logger.dart';
import 'src/common/config/injector.dart';

void main() async {
  runZonedGuarded<void>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies(environment: 'env');
    runApp(const App());
  }, (Object exception, StackTrace stackTrace) async {
    final getIt = GetIt.instance;
    if (getIt.isRegistered<AppLogger>()) {
      getIt<AppLogger>().logError(
        exception,
        stackTrace: stackTrace,
        reason: 'Uncaught zoned error',
        fatal: true,
      );
      return;
    }

    developer.log(
      '[FALLBACK ERROR] $exception',
      name: 'Bootstrap',
      error: exception,
      stackTrace: stackTrace,
    );
  });
}

void streamFunc() async {
  final module = StreamsModule();

  // HOT STREAM
  final sub1 = module.notificationsStream().listen(
        (event) => print('Listener 1: $event'),
        onError: (e) => print('Listener 1 error: $e'),
        onDone: () => print('Listener 1 done'),
      );

  final sub2 = module.notificationsStream().listen(
        (event) => print('Listener 2: $event'),
      );

  module.sendNotification('Payment success');

  // COLD STREAM
  module.coldCounterStream().listen(
        (event) => print('Cold A: $event'),
      );

  await Future.delayed(const Duration(seconds: 2));

  module.coldCounterStream().listen(
        (event) => print('Cold B: $event'),
      );

  // COMBINE LATEST
  module.dashboardStream().listen(
        (dashboard) => print(dashboard),
        onError: (e) => print('Dashboard error: $e'),
      );

  // RETRY + ERROR HANDLING
  module.unstableApiWithRetry().listen(
        (data) => print('Result: $data'),
        onError: (e) => print('Error: $e'),
      );

  await Future.delayed(const Duration(seconds: 10));

  await sub1.cancel();
  await sub2.cancel();
  await module.dispose();
}
