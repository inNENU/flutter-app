// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paragraph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyParagraph _$MyParagraphFromJson(Map<String, dynamic> json) {
  return MyParagraph(
    json['text'] ?? '',
    head: json['head'],
    align: json['align'] as String ?? 'justify',
    selectable: json['selectable'] as bool ?? true,
    src: json['src'] as String,
    desc: json['desc'] as String,
  );
}

Map<String, dynamic> _$MyParagraphToJson(MyParagraph instance) =>
    <String, dynamic>{
      'text': instance.text,
      'head': instance.head,
      'align': instance.align,
      'selectable': instance.selectable,
      'src': instance.src,
      'desc': instance.desc,
    };
