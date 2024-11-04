import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_architecture/src/common/presentation/app.dart';

import 'src/common/config/injector.dart';

void main() async {
  runZonedGuarded<void>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await configureDependencies(environment: 'env');
    runApp(const App());
  }, (Object exception, StackTrace stackTrace) async {
    print(exception);
  });
}
