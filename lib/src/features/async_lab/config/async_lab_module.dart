import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/features/async_lab/data/services/async_lab_service.dart';
import 'package:test_architecture/src/features/async_lab/domain/behaviors/async_lab_behavior.dart';

@module
abstract class AsyncLabModule {
  @factoryMethod
  AsyncLabBehavior asyncLabBehavior(AsyncLabService service) => service;
}
