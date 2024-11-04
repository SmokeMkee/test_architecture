import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_response_dto.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class NewsResponseDataDto {
  @JsonKey(name: 'data')
  final NewsResponseDto list;

  factory NewsResponseDataDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$NewsResponseDataDtoFromJson(json);
  }

  NewsResponseDataDto({required this.list});
}

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class NewsResponseDto {
  @JsonKey(name: 'data')
  final List<NewsDto> list;

  factory NewsResponseDto.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$NewsResponseDtoFromJson(json);
  }

  NewsResponseDto({required this.list});
}

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class NewsDto {
  final String id;
  final String title;
  final String content;

  factory NewsDto.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$NewsDtoFromJson(json);

  NewsDto({required this.id, required this.title, required this.content});
}
