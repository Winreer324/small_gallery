import 'dart:io';

import 'package:dio/dio.dart';
import 'package:gateway/gateway.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:small_gallery/app/di/injection.config.dart';
import 'package:small_gallery/app/resources/resources_imports.dart';

@injectableInit
void setInjectionsApp(GetIt _injection,{String? environment}) => $initGetIt(
  _injection,
      environment: environment,
    );

// dio

// @module
// abstract class DioDi {
//   @LazySingleton()
//   Dio get dio => () {
//         Dio dio = Dio();
//         dio.options.headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
//         dio.options.baseUrl = GatewayConstants.baseUrl;
//         dio.interceptors.add(AppConst.alice.getDioInterceptor());
//
//         return dio;
//       }();
// }