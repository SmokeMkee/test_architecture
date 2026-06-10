import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/features/auth/data/services/auth_service.dart';
import 'package:test_architecture/src/features/auth/domain/behaviors/auth_behavior.dart';

@module
abstract class AuthModule {
  @factoryMethod
  AuthBehavior authBehavior(AuthService authService) => authService;
}
