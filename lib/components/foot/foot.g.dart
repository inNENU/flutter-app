// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'foot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyFoot _$MyFootFromJson(Map<String, dynamic> json) {
  return MyFoot(
    author: json['author'] as String ?? 'Mr.Hope',
    time: json['time'] as String ?? '',
    desc: json['desc'] as String ?? '',
  );
}

Map<String, dynamic> _$MyFootToJson(MyFoot instance) => <String, dynamic>{
      'desc': instance.desc,
      'author': instance.author,
      'time': instance.time,
    };
