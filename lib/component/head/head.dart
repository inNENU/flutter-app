import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'head.g.dart';

@JsonSerializable()
class MyHead extends StatelessWidget {
  /// 页面标题
  final String title;

  MyHead(this.title);
  factory MyHead.fromJson(Map<String, dynamic> json) => _$MyHeadFromJson(json);

  Map<String, dynamic> toJson() => _$MyHeadToJson(this);

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(this.title),
      );
}
