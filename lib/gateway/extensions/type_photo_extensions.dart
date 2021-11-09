import 'package:small_gallery/domain/enum/type_photo.dart';
import 'package:small_gallery/gateway/resources/api_constants.dart';

extension TypePhotoExtensions on TypePhoto {
  String get typePhotoByString {
    switch (this) {
      case TypePhoto.newPhoto:
        return ApiConstants.newType;
      case TypePhoto.popularPhoto:
        return ApiConstants.popularType;
      default:
        return '';
    }
  }
}
