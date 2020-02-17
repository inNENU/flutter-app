import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:innenu/component/jsonTools.dart';

part 'paragraph.g.dart';

@JsonSerializable()
class MyParagraph extends StatelessWidget {
  /// 段落文字
  @JsonKey(defaultValue: '')
  final String text;

  /// 文字对齐方式
  @JsonKey(defaultValue: 'justify')
  final String align;

  MyParagraph(this.text, {this.align = 'justify'});
  factory MyParagraph.fromJson(Map<String, dynamic> json) =>
      _$MyParagraphFromJson(json);

  Map<String, dynamic> toJson() => _$MyParagraphToJson(this);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(children: [
        Expanded(
            child: SelectableText(
          this.text,
          style: Theme.of(context).textTheme.body1,
          textAlign: JSONTools.getAlign(this.align),
        ))
      ]));
}
