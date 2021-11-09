import 'dart:core';

import 'package:small_gallery/domain/entity/pagination_response.dart';
import 'package:small_gallery/domain/entity/photo_entity.dart';
import 'package:small_gallery/domain/enum/type_photo.dart';

abstract class PhotoGateway {
  const PhotoGateway();

  Future<PaginationResponse<PhotoEntity>> fetchPhoto({
    required TypePhoto typePhoto,
    required int page,
    required int limit,
  });
}
