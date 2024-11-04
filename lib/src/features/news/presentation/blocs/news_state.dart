import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:test_architecture/src/common/domain/failures/failure.dart';
import 'package:test_architecture/src/features/news/domain/models/news.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  factory NewsState({
    @Default(NewsDataInitial()) NewsDataState newsState,
  }) = _NewsState;
}

@freezed
sealed class NewsDataState with _$NewsDataState {
  const factory NewsDataState.initial() = NewsDataInitial;

  const factory NewsDataState.loading() = NewsDataLoading;

  const factory NewsDataState.failure(Failure failure) = NewsDataFailure;

  const factory NewsDataState.successLoaded(
    List<News> news,
  ) = NewsDataSuccessLoaded;
}
