import 'package:dio/dio.dart';
import 'package:test_architecture/src/common/domain/failures/failure.dart';

extension DioExceptionMapperX on DioException {
  Failure toFailure(String defaultMessage) {
    try {
      switch (type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return ConnectionTimeoutFailure(
            message: message ?? response?.data,
          );
        case DioExceptionType.cancel:
          return CanceledRequestFailure();
        case DioExceptionType.badCertificate:
        case DioExceptionType.badResponse:
          switch (response?.statusCode) {
            case 401:
              return UnauthorizedFailure(
                message: response?.data?['message'] ?? defaultMessage,
              );
            case 403:
              return AccessDeniedFailure(
                message: response?.data?['message'] ?? defaultMessage,
              );
            case 404:
              return NotFoundFailure(
                message: response?.data?['message'] ?? defaultMessage,
              );
            default:
              //final data = response?.data;

              // if (data != null) {
              //   BaseErrorDto error;
              //   try {
              //     error = BaseErrorDto.fromJson(data);
              //   } catch (e) {
              //     error = BaseErrorDto.fromJson(jsonDecode(data));
              //   }
              //   final fieldMessages = {
              //     for (final fieldError in error.fieldMessages)
              //       fieldError.field: fieldError.message,
              //   };
              //   return BaseFailure(
              //     code: error.code ?? response?.statusCode?.toInt() ?? 500,
              //     message: error.message ?? defaultMessage,
              //     fieldMessages: fieldMessages,
              //   );
              // }

              return BadResponseFailure(message: defaultMessage);
          }

        default:
          return OtherFailure(
            message: defaultMessage,
            code: response?.statusCode,
            error: error,
          );
      }
    } catch (_) {
      return OtherFailure(
        code: response?.statusCode,
        message: defaultMessage,
      );
    }
  }
}
