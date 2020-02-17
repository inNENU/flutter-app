// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyImage _$MyImageFromJson(Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['src']);
  return MyImage(
    json['src'] as String,
  );
}

Map<String, dynamic> _$MyImageToJson(MyImage instance) => <String, dynamic>{
      'src': instance.src,
    };
