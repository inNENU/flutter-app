// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyListConfig _$MyListConfigFromJson(Map<String, dynamic> json) {
  return MyListConfig(
    json['text'] as String ?? '',
    icon: json['icon'] as String,
    desc: json['desc'] as String,
    aim: json['aim'] as String,
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$MyListConfigToJson(MyListConfig instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'desc': instance.desc,
      'aim': instance.aim,
      'url': instance.url,
    };

MyList _$MyListFromJson(Map<String, dynamic> json) {
  return MyList(
    MyList._getContentFromJson(json['content'] as List<Map<String, String>>),
    head: json['head'],
    foot: json['foot'] as String ?? '',
  );
}

Map<String, dynamic> _$MyListToJson(MyList instance) => <String, dynamic>{
      'content': instance.content,
      'head': instance.head,
      'foot': instance.foot,
    };
