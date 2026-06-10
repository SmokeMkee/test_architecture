import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_architecture/src/common/extensions/build_context_x.dart';
import 'package:test_architecture/src/features/async_lab/presentation/blocs/async_lab_bloc.dart';
import 'package:test_architecture/src/features/async_lab/presentation/blocs/async_lab_event.dart';
import 'package:test_architecture/src/features/async_lab/presentation/screens/async_lab_screen.dart';

@RoutePage()
class AsyncLabWrapperScreen extends StatelessWidget {
  const AsyncLabWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => context.di<AsyncLabBloc>()..add(AsyncLabStarted()),
      child: const AsyncLabScreen(),
    );
  }
}
