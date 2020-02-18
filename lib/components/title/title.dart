import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'title.g.dart';

/// 标题组件
@JsonSerializable()
class MyTitle extends StatelessWidget {
  /// 标题文字
  @JsonKey(defaultValue: '')
  final String text;

  MyTitle(this.text);
  factory MyTitle.fromJson(Map<String, dynamic> json) =>
      _$MyTitleFromJson(json);
  Map<String, dynamic> toJson() => _$MyTitleToJson(this);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: SelectableText(
        text,
        style: Theme.of(context).textTheme.title,
      ));
}
