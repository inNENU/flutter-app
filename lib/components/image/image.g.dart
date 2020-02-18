// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyImage _$MyImageFromJson(Map<String, dynamic> json) {
  return MyImage(
    json['src'] as String ?? '',
    json['desc'] as String,
  );
}

Map<String, dynamic> _$MyImageToJson(MyImage instance) => <String, dynamic>{
      'src': instance.src,
      'desc': instance.desc,
    };
