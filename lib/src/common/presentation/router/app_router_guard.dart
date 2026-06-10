import 'package:auto_route/auto_route.dart';
import 'package:test_architecture/src/common/config/services/session_service.dart';
import 'package:test_architecture/src/features/news/config/news_route_module.dart';

class AuthGuard extends AutoRouteGuard {
  AuthGuard(this._sessionService);

  final SessionService _sessionService;

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    if (_sessionService.isAuthorized) {
      resolver.next(true);
      return;
    }
    router.replace(const LoginRoute());
  }
}

class AppRouteGuard {
  final List<AutoRouteGuard> guards;

  AppRouteGuard(this.guards);
}