import 'dart:io';

import 'package:gateway/gateway.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioDi {
  @LazySingleton()
  Dio get dio => () {
        Dio dio = Dio();
        dio.options.headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
        dio.options.baseUrl = GatewayConstants.baseUrl;
        dio.interceptors.add(GatewayConstants.alice.getDioInterceptor());

        return dio;
      }();
}
