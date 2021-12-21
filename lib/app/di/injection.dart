import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:gateway/gateway.dart';
import 'package:get_it/get_it.dart';

GetIt injection = GetIt.I;

Future setInjections() async {
  /// dio
  Dio dio = Dio();
  dio.options.headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
  dio.options.baseUrl = GatewayConstants.baseUrl;
  injection.registerLazySingleton<Dio>(() => dio);

  injection.registerLazySingleton<PhotoGateway>(() => HttpPhotoGateway(dio: dio));
}
