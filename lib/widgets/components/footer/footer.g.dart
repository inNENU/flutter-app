// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'footer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FooterComponent _$FooterComponentFromJson(Map<String, dynamic> json) {
  return FooterComponent(
    author: json['author'] as String ?? '',
    time: json['time'] as String ?? '',
    desc: json['desc'] as String ?? '',
  );
}

Map<String, dynamic> _$FooterComponentToJson(FooterComponent instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'author': instance.author,
      'time': instance.time,
    };
