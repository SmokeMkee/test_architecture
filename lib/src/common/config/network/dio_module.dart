import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'http_config.dart';

@module
abstract class DioModule {
  @Named('public-dio')
  @injectable
  Dio getProtectedDio() => Dio(
        BaseOptions(
          baseUrl: '',
          receiveTimeout:
              const Duration(milliseconds: HttpConfig.receivedTimeout),
          connectTimeout:
              const Duration(milliseconds: HttpConfig.connectionTimeout),
        ),
      );
}
