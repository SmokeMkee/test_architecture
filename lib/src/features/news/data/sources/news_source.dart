import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_architecture/src/features/news/data/dtos/responses/news_response_dto.dart';

part 'news_source.g.dart';

@RestApi()
abstract class NewsSource {
  factory NewsSource(
    Dio dio, {
    String baseUrl,
  }) = _NewsSource;

  @GET('Posts/all')
  Future<NewsResponseDataDto> getNews(
    @Query('PageNumber') int page,
    @Query('PageSize') int pageSize,
  );
}
