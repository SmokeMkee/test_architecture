import 'package:injectable/injectable.dart';

@lazySingleton
class EnvironmentConfig {
  final String baseUrl = 'https://dev-api.investudy.app/api/';
}
