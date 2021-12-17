part of app;

extension PhotoEntityX on PhotoEntity {
  String get imageUrl => '${DomainConstants.basePathMedia}${image.name}';
}
