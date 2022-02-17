part of gateway;

@LazySingleton(as: PhotoGateway)
class HttpPhotoGateway extends PhotoGateway {
  final Dio dio;

  const HttpPhotoGateway({required this.dio});

  @override
  Future<PaginationResponse<PhotoEntity>> fetchPhoto({
    required TypePhoto typePhoto,
    required int page,
    required int limit,
  }) async {
    final Map<String, dynamic> queryParameters =  <String, dynamic>{
      GatewayConstants.queryParametersPage: page,
      GatewayConstants.queryParametersLimit: limit,
      typePhoto.typePhotoByString.toLowerCase(): true,
    };

    return ApiRequestHandler.sendRequest<PaginationResponse<PhotoEntity>, Map<String, dynamic>>(
      request: dio.get<Object?>(GatewayConstants.photos, queryParameters: queryParameters),
      converter: (json) => PaginationResponse<PhotoEntity>.fromJson(json),
    );
  }
}
