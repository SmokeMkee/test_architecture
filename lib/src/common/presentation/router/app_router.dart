import 'package:auto_route/auto_route.dart';
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
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: NewsWrapperRoute.page,
          initial: true,
          children: [
            AutoRoute(
              initial: true,
              path: 'news',
              page: NewsRoute.page,
            )
          ],
        )
      ];
}
