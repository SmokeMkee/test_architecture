import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/domain/models/callable.dart';
import 'package:test_architecture/src/common/domain/models/result.dart';
import 'package:test_architecture/src/features/news/domain/behaviors/get_news_behavior.dart';
import 'package:test_architecture/src/features/news/domain/models/news.dart';

typedef GetNewsParams = ({
  int page,
  int pageSize,
});

@injectable
class GetNewsUseCase implements Callable<GetNewsParams, List<News>> {
  final GetNewsBehavior _behavior;

  GetNewsUseCase(this._behavior);

  @override
  Future<Result<List<News>>> call(params) async {
    return _behavior.getNews(
      page: params.page,
      pageSize: params.pageSize,
    );
  }
}
