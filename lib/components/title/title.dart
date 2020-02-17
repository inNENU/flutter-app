import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'title.g.dart';

@JsonSerializable()
class MyTitle extends StatelessWidget {
  /// 标题文字
  @JsonKey(required: true)
  final String text;

  /// 段落标题
  final dynamic head;

  MyTitle(this.text, {this.head});
  factory MyTitle.fromJson(Map<String, dynamic> json) =>
      _$MyTitleFromJson(json);
  Map<String, dynamic> toJson() => _$MyTitleToJson(this);

  // MyTitle.fromJson(Map<String, String> config) : text = config['text'] ?? '';

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: SelectableText(
                text,
                style: Theme.of(context).textTheme.title,
              )))
    ]);
  }
}
