// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyTitle _$MyTitleFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['text']);
  return MyTitle(
    json['text'] as String,
    head: json['head'],
  );
}

Map<String, dynamic> _$MyTitleToJson(MyTitle instance) => <String, dynamic>{
      'text': instance.text,
      'head': instance.head,
    };
