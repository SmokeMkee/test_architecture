abstract interface class Failure {
  String get message;
}

class NotFoundFailure implements Failure {
  int get code => 404;

  @override
  final String message;

  NotFoundFailure({required this.message});
}

class UnauthorizedFailure implements Failure {
  int get code => 401;

  @override
  final String message;

  UnauthorizedFailure({required this.message});
}

class AccessDeniedFailure implements Failure {
  int get code => 403;

  @override
  final String message;

  AccessDeniedFailure({required this.message});
}

class ConnectionTimeoutFailure implements Failure {
  @override
  final String message;

  ConnectionTimeoutFailure({
    required this.message,
  });
}

class CanceledRequestFailure implements Failure {
  @override
  final String message = 'Request Canceled';
}

class BadResponseFailure implements Failure {
  @override
  final String message;

  BadResponseFailure({required this.message});
}

class UnexpectedFailure implements Failure {
  @override
  final String message = 'Unexpected Failure';
}

class OtherFailure implements Failure {
  final int? code;
  final dynamic error;

  @override
  final String message;

  OtherFailure({
    required this.message,
    this.code,
    this.error,
  });
}

class CoreNavigationFailure implements Failure {
  @override
  final String message;

  CoreNavigationFailure({required this.message});
}

class CoreConfigurationFailure implements Failure {
  @override
  final String message;

  CoreConfigurationFailure({required this.message});
}

class BaseFailure implements Failure {
  final int code;

  @override
  final String message;

  final Map<String, String> fieldMessages;

  BaseFailure({
    required this.message,
    this.code = 400,
    this.fieldMessages = const {},
  });
}

class ContactsPermissionFailure implements Failure {
  @override
  final String message = 'Contacts Permission Failure';
}

class LocationPermissionFailure implements Failure {
  @override
  final String message = 'Location Permission Failure';
}

class CameraPermissionFailure implements Failure {
  @override
  final String message = 'Camera Permission Failure';
}