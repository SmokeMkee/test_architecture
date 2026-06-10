import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_architecture/src/common/config/logging/app_logger.dart';

import 'http_config.dart';

@module
abstract class DioModule {
  @Named('public-dio')
  @injectable
  Dio getProtectedDio(AppLogger appLogger) {
    final dio = Dio(
      BaseOptions(
        baseUrl: '',
        receiveTimeout: const Duration(milliseconds: HttpConfig.receivedTimeout),
        connectTimeout:
            const Duration(milliseconds: HttpConfig.connectionTimeout),
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          appLogger.logBusinessEvent(
            'network_request',
            payload: {
              'method': options.method,
              'url': options.uri.toString(),
              'headers': options.headers,
              'queryParameters': options.queryParameters,
              'requestBody': options.data,
            },
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          appLogger.logBusinessEvent(
            'network_response',
            payload: {
              'method': response.requestOptions.method,
              'url': response.requestOptions.uri.toString(),
              'statusCode': response.statusCode,
              'responseBody': response.data,
            },
          );
          handler.next(response);
        },
        onError: (error, handler) {
          appLogger.logBusinessEvent(
            'network_error',
            payload: {
              'method': error.requestOptions.method,
              'url': error.requestOptions.uri.toString(),
              'queryParameters': error.requestOptions.queryParameters,
              'requestBody': error.requestOptions.data,
              'errorType': error.type.name,
              'errorMessage': error.message,
              'statusCode': error.response?.statusCode,
              'responseBody': error.response?.data,
            },
          );
          appLogger.logError(
            error,
            stackTrace: error.stackTrace,
            reason: 'network_error',
          );
          handler.next(error);
        },
      ),
    );

    return dio;
  }
}
