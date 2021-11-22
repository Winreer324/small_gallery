import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:small_gallery/app/resources/app_const.dart';
import 'package:small_gallery/domain/gateway/photo_gateway.dart';
import 'package:small_gallery/gateway/api/http_photo_gateway.dart';
import 'package:small_gallery/gateway/resources/api_constants.dart';

GetIt injection = GetIt.I;

Future setInjections() async {
  /// dio
  Dio dio = Dio();
  dio.options.headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
  dio.options.baseUrl = ApiConstants.baseUrl;
  dio.options.connectTimeout = AppConst.timeoutDurationInMilliseconds;
  dio.options.receiveTimeout = AppConst.timeoutDurationInMilliseconds;
  dio.interceptors.add(AppConst.alice.getDioInterceptor());
  injection.registerLazySingleton<Dio>(() => dio);

  injection.registerLazySingleton<PhotoGateway>(() => HttpPhotoGateway(dio: dio));
}
