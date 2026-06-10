import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/config/logging/app_logger.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/news/domain/use_cases/get_news_use_case.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_event.dart';
import 'package:test_architecture/src/features/news/presentation/blocs/news_state.dart';

@injectable
class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase _getNewsUseCase;
  final AppLogger _logger;
  int currentPage = 1;
  int pageSize = 100;

  NewsBloc(
    this._getNewsUseCase,
    this._logger,
  ) : super(NewsState()) {
    on<GetNews>((event, emit) async {
      _logger.logBusinessEvent(
        'news_fetch_started',
        payload: {'page': currentPage, 'pageSize': pageSize},
      );
      emit(state.copyWith(newsState: const NewsDataState.loading()));
      final response = await _getNewsUseCase.call(
        (
          page: currentPage,
          pageSize: pageSize,
        ),
      );
      final result = response.value;
      if (result != null) {
        _logger.logBusinessEvent(
          'news_fetch_succeeded',
          payload: {'count': result.length},
        );
        emit(state.copyWith(newsState: NewsDataState.successLoaded(result)));
        return;
      }

      _logger.logBusinessEvent(
        'news_fetch_failed',
        payload: {'reason': response.failureOrDefault.message},
      );
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
