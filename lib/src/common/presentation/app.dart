import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_architecture/src/common/extensions/build_context_x.dart';
import 'package:test_architecture/src/common/presentation/router/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Key _refreshKey = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final appRouter = context.di<AppRouter>();
    return MaterialApp.router(
      key: _refreshKey,
      debugShowCheckedModeBanner: false,
      routerConfig:appRouter.config(),
      builder: (context, child) {
        final mediaQueryData = MediaQuery.of(context);
        return MediaQuery(
          data: mediaQueryData.copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child ?? const Placeholder(),
        );
      },
    );
  }
}
