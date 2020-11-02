// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DocComponent _$DocComponentFromJson(Map<String, dynamic> json) {
  return DocComponent(
    json['name'] as String,
    json['url'] as String,
    icon: json['icon'] as String,
    downloadable: json['downloadable'] as bool ?? true,
  );
}

Map<String, dynamic> _$DocComponentToJson(DocComponent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'icon': instance.icon,
      'url': instance.url,
      'downloadable': instance.downloadable,
    };
