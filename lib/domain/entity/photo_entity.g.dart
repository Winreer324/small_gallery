// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoEntity _$PhotoEntityFromJson(Map<String, dynamic> json) => PhotoEntity(
      id: json['id'] as int,
      name: json['name'] as String,
      image: ImageEntity.fromJson(json['image'] as Map<String, dynamic>),
      description: json['description'] as String?,
      newType: json['new'] as bool? ?? false,
      popularType: json['popular'] as bool? ?? false,
    );

Map<String, dynamic> _$PhotoEntityToJson(PhotoEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'new': instance.newType,
      'popular': instance.popularType,
      'image': instance.image.toJson(),
    };
