import 'package:dio/dio.dart';

abstract class Failure {}

class RequestFailure extends Failure {
  final int code;
  final String message;

  RequestFailure({required this.code, required this.message});
}

class DioFailure extends Failure {
  final DioError error;

  DioFailure({required this.error});
}

class NetworkFailure extends Failure {}

class LocalStorageFailure extends Failure {
  final String message;

  LocalStorageFailure({required this.message});
}

class UndefinedFailure extends Failure {
  final dynamic error;

  UndefinedFailure({required this.error});
}
