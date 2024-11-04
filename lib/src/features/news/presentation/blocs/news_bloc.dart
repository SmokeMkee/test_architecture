import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/news/domain/use_cases/get_news_use_case.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_event.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase _getNewsUseCase;
  int currentPage = 1;
  int pageSize = 100;

  NewsBloc(this._getNewsUseCase) : super(NewsState()) {
    on<GetNews>((event, emit) async {
      emit(state.copyWith(newsState: const NewsDataState.loading()));
      final response = await _getNewsUseCase.call(
        (
          page: currentPage,
          pageSize: pageSize,
        ),
      );
      final result = response.value;
      if (result != null) {
        emit(state.copyWith(newsState: NewsDataState.successLoaded(result)));
        return;
      }

      emit(
        state.copyWith(
          newsState: NewsDataState.failure(
            response.failureOrDefault,
          ),
        ),
      );
    });
    add(GetNews());
  }
}
