import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/domain/mappers/dio_exception_mapper_x.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/news/data/mappers/news_mapper_x.dart';
import 'package:test_architecture/src/features/news/data/sources/news_source.dart';
import 'package:test_architecture/src/features/news/domain/behaviors/get_news_behavior.dart';
import 'package:test_architecture/src/features/news/domain/models/news.dart';

@lazySingleton
class NewsService implements GetNewsBehavior {
  final NewsSource _newsSource;

  NewsService(this._newsSource);

  @override
  Future<Result<List<News>>> getNews({
    required int page,
    required int pageSize,
  }) async {
    try {
      final result = await _newsSource.getNews(page, pageSize);

      return SuccessResult(result.toModel());
    } on DioException catch (e) {
      return ErrorResult(e.toFailure('locale.errorOccurred'));
    }
  }
}
