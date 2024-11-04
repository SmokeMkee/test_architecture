import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/news/domain/models/news.dart';

abstract interface class GetNewsBehavior {
  Future<Result<List<News>>> getNews({
    required int page,
    required int pageSize,
  });
}
