import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_architecture/src/common/presentation/router/app_router.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_bloc.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_event.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_state.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Новости'),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const AsyncLabWrapperRoute()),
            icon: const Icon(Icons.bolt_rounded),
            tooltip: 'Async Lab',
          ),
        ],
      ),
      body: BlocConsumer<NewsBloc, NewsState>(
        listenWhen: (oldState, newState) {
          return oldState.newsState != newState.newsState;
        },
        builder: (context, state) {
          return state.newsState.when(
            initial: () {
              return const Center(child: Text('Подготовка данных...'));
            },
            loading: () {
              return const Center(child: CircularProgressIndicator());
            },
            failure: (failure) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.error_outline_rounded,
                        size: 48,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        failure.message,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      FilledButton.icon(
                        onPressed: () => context.read<NewsBloc>().add(GetNews()),
                        icon: const Icon(Icons.refresh_rounded),
                        label: const Text('Повторить'),
                      ),
                    ],
                  ),
                ),
              );
            },
            successLoaded: (list) {
              if (list.isEmpty) {
                return const Center(child: Text('Новостей пока нет'));
              }
              return ListView.builder(
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
                itemCount: list.length,
                itemBuilder: (context, int index) {
                  final news = list[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      elevation: 1.5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              news.title,
                              style: Theme.of(context).textTheme.titleMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              news.content,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'ID: ${news.id}',
                              style: Theme.of(context).textTheme.labelSmall
                                  ?.copyWith(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}
