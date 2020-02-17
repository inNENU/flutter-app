import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:innenu/components/jsonTools.dart';

part 'paragraph.g.dart';

/// 单个段落组件
class _ParagraphWidget extends StatelessWidget {
  /// 段落文字
  final String text;

  /// 段落文字对齐方式
  final String align;

  /// 段落竖直边距
  final double verticalPadding;

  /// 段落文字是否可选中
  final bool selectable;

  _ParagraphWidget(this.text,
      {this.align = 'justify',
      this.verticalPadding = 4,
      this.selectable = true});

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: selectable
          ? SelectableText(
              text,
              style: Theme.of(context).textTheme.body1,
              textAlign: JSONTools.getAlign(align),
            )
          : Text(
              text,
              style: Theme.of(context).textTheme.body1,
              textAlign: JSONTools.getAlign(align),
            ));
}

@JsonSerializable()
class MyParagraph extends StatelessWidget {
  /// 段落文字
  ///
  /// 可以是 `String` 或 `List<String>`。后者会显示多个段落。
  @JsonKey(defaultValue: '')
  final dynamic text;

  /// 段落标题
  ///
  /// 可以是 `String` 或 `true`，后者会在段落面前留白。
  final dynamic head;

  /// 文字对齐方式
  ///
  /// 只能是 `'left'`, `'right'`, `'center'` 或 `'justify'` 中的一种
  @JsonKey(defaultValue: 'justify')
  final String align;

  /// 文字是否可以选中
  @JsonKey(defaultValue: true)
  final bool selectable;

  MyParagraph(this.text,
      {this.head, this.align = 'justify', this.selectable = true});
  factory MyParagraph.fromJson(Map<String, dynamic> json) =>
      _$MyParagraphFromJson(json);

  Map<String, dynamic> toJson() => _$MyParagraphToJson(this);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: text is String
          // 单个段落
          ? _ParagraphWidget(
              text as String,
              align: align,
              verticalPadding: 8,
              selectable: selectable,
            )
          // 多个段落
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: List.generate(
                  (text as List<String>).length,
                  (index) => _ParagraphWidget(
                        (text as List<String>)[index],
                        align: align,
                        selectable: selectable,
                      ))));
}
