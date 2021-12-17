part of app;

GetIt injection = GetIt.I;

Future setInjections() async {
  /// dio
  Dio dio = Dio();
  dio.options.headers.putIfAbsent(HttpHeaders.contentTypeHeader, () => 'application/json');
  dio.options.baseUrl = DomainConstants.baseUrl;
  dio.options.connectTimeout = AppConst.timeoutDurationInMilliseconds;
  dio.options.receiveTimeout = AppConst.timeoutDurationInMilliseconds;
  // dio.interceptors.add(AppConst.alice.getDioInterceptor());
  injection.registerLazySingleton<Dio>(() => dio);

  injection.registerLazySingleton<PhotoGateway>(() => HttpPhotoGateway(dio: dio));
}
