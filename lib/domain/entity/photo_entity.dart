import 'package:json_annotation/json_annotation.dart';
import 'package:small_gallery/domain/constants/api_constants.dart';

import 'image_entity.dart';

part 'photo_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoEntity {
  final int id;
  final String name;
  final String? description;
  @JsonKey(defaultValue: false, name: 'new')
  final bool newType;
  @JsonKey(defaultValue: false, name: 'popular')
  final bool popularType;
  final ImageEntity image;

  PhotoEntity({
    required this.id,
    required this.name,
    required this.image,
    this.description,
    this.newType = false,
    this.popularType = false,
  });

  factory PhotoEntity.fromJson(Map<String, dynamic> json) => _$PhotoEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoEntityToJson(this);

  String get imageUrl => '${ApiConstants.basePathMedia}${image.name}';
}
