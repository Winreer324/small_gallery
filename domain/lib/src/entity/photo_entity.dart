import 'package:freezed_annotation/freezed_annotation.dart';

import 'image_entity.dart';

part 'photo_entity.freezed.dart';
part 'photo_entity.g.dart';

@freezed
class PhotoEntity with _$PhotoEntity {
  @JsonSerializable(explicitToJson: true)
  const factory PhotoEntity({
    required int id,
    required String name,
    String? description,
    @JsonKey(defaultValue: false, name: 'new') @Default(false) bool newType,
    @JsonKey(defaultValue: false, name: 'popular') @Default(false) bool popularType,
    required ImageEntity image,
  }) = _PhotoEntity;

  factory PhotoEntity.fromJson(Map<String, dynamic> json) => _$PhotoEntityFromJson(json);
}
