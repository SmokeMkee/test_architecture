import 'package:test_architecture/src/features/news/domain/models/news.dart';

sealed class NewsEvent {}

class GetNews extends NewsEvent {}
