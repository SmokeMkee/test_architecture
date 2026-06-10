import 'package:auto_route/auto_route.dart';
import 'package:test_architecture/src/common/presentation/router/app_router_guard.dart';
import 'package:test_architecture/src/features/auth/presentation/screens/login_screen.dart';
import 'package:test_architecture/src/features/auth/presentation/screens/profile_screen.dart';
import 'package:test_architecture/src/features/async_lab/presentation/screens/async_lab_wrapper_screen.dart';
import 'package:test_architecture/src/features/news/config/news_route_module.dart';
import 'package:test_architecture/src/features/news/presentation/screens/news_screen.dart';
import 'package:test_architecture/src/features/news/presentation/screens/news_wrapper_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Screen,Route',
  modules: [
    NewsRouteModule,
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter({required this.authGuard});

  final AuthGuard authGuard;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/login',
          initial: true,
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: '/profile',
          page: ProfileRoute.page,
          guards: [authGuard],
        ),
        AutoRoute(
          path: '/news',
          page: NewsWrapperRoute.page,
          guards: [authGuard],
          children: [
            AutoRoute(
              initial: true,
              path: 'news',
              page: NewsRoute.page,
            )
          ],
        ),
        AutoRoute(
          path: '/async-lab',
          page: AsyncLabWrapperRoute.page,
          guards: [authGuard],
        ),
      ];
}
