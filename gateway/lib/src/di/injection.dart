import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gateway/gateway.dart';
import 'package:gateway/src/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

@injectableInit
void setInjectionsGateway(GetIt _injection, {String? environment}) => $initGetIt(
      _injection,
      environment: environment,
    );

// network nfo

@module
abstract class NetworkInfoDi {
  @LazySingleton()
  DataConnectionChecker get dataConnectionChecker => DataConnectionChecker();
}

// dio

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