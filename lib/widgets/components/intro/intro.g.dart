// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IntroComponent _$IntroComponentFromJson(Map<String, dynamic> json) {
  return IntroComponent(
    json['name'] as String,
    json['logo'] as String,
    desc: json['desc'] as String ?? '',
  );
}

Map<String, dynamic> _$IntroComponentToJson(IntroComponent instance) =>
    <String, dynamic>{
      'name': instance.name,
      'logo': instance.logo,
      'desc': instance.desc,
    };
