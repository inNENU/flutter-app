// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageComponent _$ImageComponentFromJson(Map<String, dynamic> json) {
  return ImageComponent(
    json['src'] as String ?? '',
    json['desc'] as String,
  );
}

Map<String, dynamic> _$ImageComponentToJson(ImageComponent instance) =>
    <String, dynamic>{
      'src': instance.src,
      'desc': instance.desc,
    };
