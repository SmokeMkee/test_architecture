import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/config/injector.config.dart';


@InjectableInit()
FutureOr<dynamic> configureDependencies({String? environment}) {
  return GetIt.instance.init(environment: environment);
}
