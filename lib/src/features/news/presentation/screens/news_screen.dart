import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_bloc.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_state.dart';

@RoutePage()
class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<NewsBloc, NewsState>(
        listenWhen: (oldState, newState) {
          return oldState.newsState != newState.newsState;
        },
        builder: (context, state) {
          return state.newsState.when(
            initial: () {
              return const SizedBox.shrink();
            },
            loading: () {
              return CircularProgressIndicator();
            },
            failure: (failure) {
              return Text(failure.message);
            },
            successLoaded: (list) {
              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, int index) {
                  return Padding(

                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Text(list[index].title),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        listener: (context, state) {
          //return state.newsState
        },
      ),
    );
  }
}
