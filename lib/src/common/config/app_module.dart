import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/config/services/session_service.dart';
import 'package:test_architecture/src/common/presentation/router/app_router.dart';
import 'package:test_architecture/src/common/presentation/router/app_router_guard.dart';

@module
abstract class AppModule {
  @lazySingleton
  AppRouter getRouter(AuthGuard authGuard) => AppRouter(authGuard: authGuard);

  @lazySingleton
  AuthGuard authGuard(SessionService sessionService) => AuthGuard(sessionService);

  // @lazySingleton
  // AppRouteGuard routeGuard(@Named('auth-guard') AutoRouteGuard authGuard) =>
  //     AppRouteGuard([authGuard]);
}
