import 'package:dio/dio.dart';
import 'package:small_gallery/domain/entity/pagination_response.dart';
import 'package:small_gallery/domain/entity/photo_entity.dart';
import 'package:small_gallery/domain/enum/type_photo.dart';
import 'package:small_gallery/domain/gateway/photo_gateway.dart';
import 'package:small_gallery/gateway/base/base_dio_request.dart';
import 'package:small_gallery/gateway/extensions/type_photo_extensions.dart';
import 'package:small_gallery/gateway/resources/api_constants.dart';

class HttpPhotoGateway extends PhotoGateway {
  final Dio dio;

  const HttpPhotoGateway({required this.dio});

  @override
  Future<PaginationResponse<PhotoEntity>> fetchPhoto({
    required TypePhoto typePhoto,
    required int page,
    required int limit,
  }) async {
    const String url = "${ApiConstants.baseUrl}/${ApiConstants.photos}";
    final queryParameters = {
      ApiConstants.queryParametersPage: page,
      ApiConstants.queryParametersLimit: limit,
      typePhoto.typePhotoByString.toLowerCase(): true,
    };

    return ApiRequestHandler.sendRequest<PaginationResponse<PhotoEntity>>(
      request: dio.get(url, queryParameters: queryParameters),
      converter: (json) => PaginationResponse<PhotoEntity>.fromJson(json),
    );
  }
}
