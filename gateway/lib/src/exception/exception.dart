part of gateway;

class BadRequest implements Exception {
  final String? message;
  final DioError? dioError;

  BadRequest(this.message, this.dioError);
}

class Forbidden implements Exception {
  final String? message;

  Forbidden(this.message);
}

class NotFound implements Exception {
  final String? message;

  NotFound(this.message);
}

class Conflict implements Exception {
  final String? message;

  Conflict(this.message);
}

class Unauthorized implements Exception {}

class FullUnauthorized implements Exception {}

class UserBlocked implements Exception {}

class ServiceUnavailable implements Exception {}

class NoInternetConnection implements Exception {}

class Duplicate implements Exception {}

class UnknownError implements Exception {
  final String? title;
  final String? description;

  UnknownError({this.title, this.description});
}

class TimeoutError implements Exception {}
