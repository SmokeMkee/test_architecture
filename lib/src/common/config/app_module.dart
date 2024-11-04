import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/presentation/router/app_router.dart';
import 'package:test_architecture/src/common/presentation/router/app_router_guard.dart';

@module
abstract class AppModule {
  @lazySingleton
  AppRouter getRouter() => AppRouter();

  // @factoryMethod
  // CoreNavigationBehavior getNavigationBehavior(AppRouter router) => router;

  // @lazySingleton
  // AppRouteGuard routeGuard(@Named('auth-guard') AutoRouteGuard authGuard) =>
  //     AppRouteGuard([authGuard]);
}
