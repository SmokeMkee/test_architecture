import 'package:test_architecture/src/features/news/data/dtos/responses/news_response_dto.dart';
import 'package:test_architecture/src/features/news/domain/models/news.dart';

extension NewsMapperX on NewsResponseDataDto {
  List<News> toModel() {
    return list.list
        .map(
          (e) => News(
            id: e.id,
            title: e.title,
            content: e.content,
          ),
        )
        .toList();
  }
}
