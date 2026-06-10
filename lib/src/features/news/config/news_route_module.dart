import 'package:auto_route/auto_route.dart';
import 'package:test_architecture/src/features/auth/presentation/screens/login_screen.dart';
import 'package:test_architecture/src/features/auth/presentation/screens/profile_screen.dart';
import 'package:test_architecture/src/features/async_lab/presentation/screens/async_lab_wrapper_screen.dart';
import 'package:test_architecture/src/features/news/presentation/screens/news_screen.dart';
import 'package:test_architecture/src/features/news/presentation/screens/news_wrapper_screen.dart';

part 'news_route_module.gm.dart';

@AutoRouterConfig.module()
class NewsRouteModule extends _$NewsRouteModule {}
