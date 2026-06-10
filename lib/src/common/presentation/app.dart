import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_architecture/src/common/extensions/build_context_x.dart';
import 'package:test_architecture/src/common/presentation/router/app_router.dart';
import 'package:test_architecture/src/features/auth/presentation/blocs/auth_bloc.dart';

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
    return BlocProvider(
      create: (context) => context.di<AuthBloc>(),
      child: MaterialApp.router(
        key: _refreshKey,
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(
          deepLinkBuilder: (deepLink) => deepLink,
        ),
        builder: (context, child) {
          final mediaQueryData = MediaQuery.of(context);
          return MediaQuery(
            data: mediaQueryData.copyWith(
              textScaler: TextScaler.noScaling,
            ),
            child: child ?? const Placeholder(),
          );
        },
      ),
    );
  }
}
