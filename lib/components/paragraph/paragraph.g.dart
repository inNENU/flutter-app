// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paragraph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyParagraph _$MyParagraphFromJson(Map<String, dynamic> json) {
  return MyParagraph(
    json['text'] ?? '',
    align: json['align'] as String ?? 'justify',
  );
}

Map<String, dynamic> _$MyParagraphToJson(MyParagraph instance) =>
    <String, dynamic>{
      'text': instance.text,
      'align': instance.align,
    };
