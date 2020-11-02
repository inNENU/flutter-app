// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardComponent _$CardComponentFromJson(Map<String, dynamic> json) {
  return CardComponent(
    title: json['title'] as String,
    desc: json['desc'] as String ?? '',
    src: json['src'] as String,
    url: json['url'] as String,
    name: json['name'] as String ?? '',
    logo: json['logo'] as String ?? '',
  );
}

Map<String, dynamic> _$CardComponentToJson(CardComponent instance) =>
    <String, dynamic>{
      'title': instance.title,
      'desc': instance.desc,
      'src': instance.src,
      'url': instance.url,
      'name': instance.name,
      'logo': instance.logo,
    };
