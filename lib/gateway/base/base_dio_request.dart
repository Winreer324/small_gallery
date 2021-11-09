import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:small_gallery/gateway/helpers/internet_connection.dart';
import 'package:small_gallery/gateway/resources/api_constants.dart';

class ApiRequestHandler {
  static Future<E> sendRequest<E>({
    required Future<Response<dynamic>> request,
    required E Function(Map<String, dynamic>) converter,
  }) async {
    final hasConnect = await InternetConnection.hasInternetConnectivity();
    if (hasConnect) {
      try {
        final Response response = await request;

        if (!response.statusCode.toString().startsWith('2')) {
          throw handleError(errorResponse: response);
        } else {
          return converter(response.data);
        }
      } on DioError catch (e) {
        throw handleError(dioError: e);
      } catch (_) {
        throw UnknownError();
      }
    } else {
      throw NoInternetConnection();
    }
  }

  static Exception handleError({Response<dynamic>? errorResponse, DioError? dioError}) {
    if (dioError?.type == DioErrorType.connectTimeout ||
        dioError?.type == DioErrorType.receiveTimeout ||
        dioError?.type == DioErrorType.sendTimeout) {
      return TimeoutError();
    }

    final Response<dynamic>? error = (errorResponse != null) ? errorResponse : dioError?.response;

    if (error == null) {
      return UnknownError();
    }

    switch (error.statusCode) {
      case 400:
        String? errorType;
        String? detail;
        if (error.data is String) {
          final Map<String, dynamic>? data = jsonDecode(error.data);
          if (data?.containsKey(ApiConstants.detail) ?? false) {
            detail = data![ApiConstants.detail];
          }
        } else if (error.data?.containsKey(ApiConstants.errorDescription) ?? false) {
          detail = error.data![ApiConstants.errorDescription];
          errorType = error.data![ApiConstants.errorType];
        }

        if (errorType == ApiConstants.invalidGrant && detail == ApiConstants.invalidRefreshToken) {
          return FullUnauthorized();
        } else if (detail == ApiConstants.userBlocked) {
          return UserBlocked();
        } else {
          return BadRequest(detail, dioError);
        }

      case 401:
        String? detail;
        String? errorType;
        if (error.data is String) {
          final Map<String, dynamic>? data = jsonDecode(error.data);
          if (data?.containsKey(ApiConstants.detail) ?? false) {
            detail = data![ApiConstants.detail];
          }
        } else if (error.data?.containsKey(ApiConstants.errorDescription) ?? false) {
          detail = error.data![ApiConstants.errorDescription];
          errorType = error.data![ApiConstants.errorType];
        }

        if (errorType == ApiConstants.invalidGrant && detail == ApiConstants.invalidRefreshToken) {
          return FullUnauthorized();
        } else if (detail == ApiConstants.userBlocked) {
          return UserBlocked();
        } else {
          return Unauthorized();
        }
      case 403:
        return Forbidden(jsonDecode(error.data)[ApiConstants.detail]);
      case 404:
        return NotFound(jsonDecode(error.data)[ApiConstants.detail]);
      case 409:
        return Conflict(jsonDecode(error.data)[ApiConstants.detail]);
      case 500:
      case 502:
        return ServiceUnavailable();
      default:
        return UnknownError();
    }
  }
}

//todo вынести в отдельный класс
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

class UnknownError implements Exception {}

class TimeoutError implements Exception {}
