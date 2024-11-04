import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/config/enviroment/nviroment_config.dart';
import 'package:test_architecture/src/features/news/data/services/news_service.dart';
import 'package:test_architecture/src/features/news/data/sources/news_source.dart';
import 'package:test_architecture/src/features/news/domain/behaviors/get_news_behavior.dart';

@module
abstract class NewsModule {
  @factoryMethod
  NewsSource newsSource(
    @Named('public-dio') Dio dio,
    EnvironmentConfig sourceConfig,
  ) =>
      NewsSource(
        dio,
        baseUrl: sourceConfig.baseUrl,
      );

  @factoryMethod
  GetNewsBehavior getNewsBehavior(
    NewsService newsService,
  ) =>
      newsService;
}
