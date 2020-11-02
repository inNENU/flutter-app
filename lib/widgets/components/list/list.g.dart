// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListComponentConfig _$ListComponentConfigFromJson(Map<String, dynamic> json) {
  return ListComponentConfig(
    json['text'] as String ?? '',
    icon: json['icon'] as String ?? '',
    desc: json['desc'] as String,
    path: json['path'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$ListComponentConfigToJson(
        ListComponentConfig instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'desc': instance.desc,
      'path': instance.path,
      'url': instance.url,
    };

ListComponent _$ListComponentFromJson(Map<String, dynamic> json) {
  return ListComponent(
    ListComponent._getContentFromJson(json['content'] as List),
    header: json['header'],
    footer: json['footer'] as String ?? '',
  );
}

Map<String, dynamic> _$ListComponentToJson(ListComponent instance) =>
    <String, dynamic>{
      'content': instance.content,
      'header': instance.header,
      'footer': instance.footer,
    };
