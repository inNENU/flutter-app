// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyGridConfig _$MyGridConfigFromJson(Map<String, dynamic> json) {
  return MyGridConfig(
    text: json['text'] as String ?? '',
    icon: json['icon'] as String ?? '',
    aim: json['aim'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$MyGridConfigToJson(MyGridConfig instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'aim': instance.aim,
      'url': instance.url,
    };

MyGrid _$MyGridFromJson(Map<String, dynamic> json) {
  return MyGrid(
    MyGrid._getContentFromJson(json['content'] as List<Map<String, String>>),
    head: json['head'],
    foot: json['foot'],
  );
}

Map<String, dynamic> _$MyGridToJson(MyGrid instance) => <String, dynamic>{
      'content': instance.content,
      'head': instance.head,
      'foot': instance.foot,
    };
