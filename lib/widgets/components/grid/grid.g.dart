// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GridComponentConfig _$GridComponentConfigFromJson(Map<String, dynamic> json) {
  return GridComponentConfig(
    text: json['text'] as String ?? '',
    icon: json['icon'] as String ?? '',
    path: json['path'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$GridComponentConfigToJson(
        GridComponentConfig instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'path': instance.path,
      'url': instance.url,
    };

GridComponent _$GridComponentFromJson(Map<String, dynamic> json) {
  return GridComponent(
    GridComponent._getContentFromJson(json['content'] as List),
    header: json['header'],
    footer: json['footer'] as String ?? '',
  );
}

Map<String, dynamic> _$GridComponentToJson(GridComponent instance) =>
    <String, dynamic>{
      'content': instance.content,
      'header': instance.header,
      'footer': instance.footer,
    };
