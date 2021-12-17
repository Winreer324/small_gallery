part of gateway;

class ApiRequestHandler {
  static Future<R> sendRequest<R, T>({
    required Future<Response<dynamic>> request,
    required R Function(T) converter,
  }) async {
    final hasConnect = await InternetConnection.hasInternetConnectivity();
    if (hasConnect) {
      try {
        final Response response = await request;

        if (!response.statusCode.toString().startsWith('2')) {
          throw _handleError(errorResponse: response);
        } else {
          return converter(response.data as T);
        }
      } on DioError catch (error) {
        if (_isDebugMode) {
          log(error.toString());
        }
        throw _handleError(dioError: error);
      } catch (error) {
        if (_isDebugMode) {
          log(error.toString());
        }
        throw UnknownError();
      }
    } else {
      throw NoInternetConnection();
    }
  }

  static Exception _handleError({Response<dynamic>? errorResponse, DioError? dioError}) {
    if (dioError?.type == DioErrorType.connectTimeout ||
        dioError?.type == DioErrorType.receiveTimeout ||
        dioError?.type == DioErrorType.sendTimeout) {
      return TimeoutError();
    }

    final Response<dynamic>? error = (errorResponse != null) ? errorResponse : dioError?.response;

    if (error == null) {
      return UnknownError();
    }

    try {
      final Map<String, dynamic>? data = jsonDecode(error.data.toString()) as Map<String, dynamic>?;

      if (data == null || data.isEmpty) {
        return UnknownError();
      }

      switch (error.statusCode) {
        case 400:
          String? detail;
          String? errorType;

          if (error.data is String) {
            if (data.containsKey(GatewayConstants.detail)) {
              detail = data[GatewayConstants.detail].toString();
            }
          } else if (data.containsKey(GatewayConstants.errorDescription)) {
            detail = error.data?[GatewayConstants.errorDescription].toString();
            errorType = error.data?[GatewayConstants.errorType].toString();
          }

          return UnknownError(title: errorType, description: detail);
        case 401:
          return Unauthorized();
        case 403:
          return Forbidden(data[GatewayConstants.detail].toString());
        case 404:
          return NotFound(data[GatewayConstants.detail].toString());
        case 409:
          return Conflict(data[GatewayConstants.detail].toString());
        case 500:
        case 502:
          return ServiceUnavailable();
        default:
          return UnknownError();
      }
    } catch (error) {
      if (_isDebugMode) {
        log(error.toString());
      }
      return UnknownError();
    }
  }

  static bool get _isDebugMode => kDebugMode;
}
