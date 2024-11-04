import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_architecture/src/common/extensions/build_context_x.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_bloc.dart';

@RoutePage()
class NewsWrapperScreen extends StatelessWidget {
  const NewsWrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.di<NewsBloc>(),
      child: const AutoRouter(),
    );
  }
}
