// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsResponseDataDto _$NewsResponseDataDtoFromJson(Map<String, dynamic> json) =>
    NewsResponseDataDto(
      list: NewsResponseDto.fromJson(json['data'] as Map<String, dynamic>),
    );

NewsResponseDto _$NewsResponseDtoFromJson(Map<String, dynamic> json) =>
    NewsResponseDto(
      list: (json['data'] as List<dynamic>)
          .map((e) => NewsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

NewsDto _$NewsDtoFromJson(Map<String, dynamic> json) => NewsDto(
      id: json['id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
    );
