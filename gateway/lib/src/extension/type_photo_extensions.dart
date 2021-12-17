part of gateway;

extension TypePhotoExtensionsX on TypePhoto {
  String get typePhotoByString {
    switch (this) {
      case TypePhoto.newPhoto:
        return GatewayConstants.newType;
      case TypePhoto.popularPhoto:
        return GatewayConstants.popularType;
      default:
        return '';
    }
  }
}
