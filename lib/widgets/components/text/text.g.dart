// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TextComponent _$TextComponentFromJson(Map<String, dynamic> json) {
  return TextComponent(
    json['text'] ?? '',
    heading: json['heading'] as String,
    align: JSONTools.getAlign(json['align'] as String),
    selectable: json['selectable'] as bool ?? true,
    src: json['src'] as String,
    desc: json['desc'] as String,
  );
}

Map<String, dynamic> _$TextComponentToJson(TextComponent instance) =>
    <String, dynamic>{
      'text': instance.text,
      'heading': instance.heading,
      'align': _$TextAlignEnumMap[instance.align],
      'selectable': instance.selectable,
      'src': instance.src,
      'desc': instance.desc,
    };

const _$TextAlignEnumMap = {
  TextAlign.left: 'left',
  TextAlign.right: 'right',
  TextAlign.center: 'center',
  TextAlign.justify: 'justify',
  TextAlign.start: 'start',
  TextAlign.end: 'end',
};
