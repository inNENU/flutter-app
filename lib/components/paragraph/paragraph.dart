import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

import '../image/image.dart';
import '../jsonTools.dart';

part 'paragraph.g.dart';

final _logger = Logger('component.paragraph');

/// 单个段落组件
class _ParagraphWidget extends StatelessWidget {
  /// 段落文字
  final String text;

  /// 段落文字对齐方式
  final TextAlign textAlign;

  /// 段落竖直边距
  final double verticalPadding;

  /// 段落文字是否可选中
  final bool selectable;

  _ParagraphWidget(
    this.text,
    this.textAlign, {
    this.verticalPadding = 4,
    this.selectable = true,
  });

  /// 文字组件
  Widget _textWidget(BuildContext context) => selectable
      ? SelectableText(
          text,
          style: Theme.of(context).textTheme.body1,
          textAlign: textAlign,
        )
      : Text(
          text,
          style: Theme.of(context).textTheme.body1,
          textAlign: textAlign,
        );

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: _textWidget(context));
}

/// 段落组件
@JsonSerializable()
class MyParagraph extends StatelessWidget {
  /// 文字
  ///
  /// 可以是 `String` 或 `List<String>`。后者会显示多个段落。
  @JsonKey(defaultValue: '')
  final dynamic text;

  /// 标题
  ///
  /// 可以是 `String` 或 `true`，后者会在段落面前留白。
  final dynamic head;

  /// 文字对齐方式
  ///
  /// 只能是 `'left'`, `'right'`, `'center'` 或 `'justify'` 中的一种
  @JsonKey(fromJson: JSONTools.getAlign)
  final TextAlign align;

  /// 文字是否可以选中
  @JsonKey(defaultValue: true)
  final bool selectable;

  /// 图片地址
  final String src;

  /// 图片描述文字
  final String desc;

  MyParagraph(
    this.text, {
    this.head,
    this.align = TextAlign.justify,
    this.selectable = true,
    this.src,
    this.desc,
  });
  factory MyParagraph.fromJson(Map<String, dynamic> json) =>
      _$MyParagraphFromJson(json);

  Map<String, dynamic> toJson() => _$MyParagraphToJson(this);

  /// 标题组件
  Widget _headWidget(BuildContext context) => selectable
      ? SelectableText(
          head as String,
          style: Theme.of(context).textTheme.subhead,
        )
      : Text(
          head as String,
          style: Theme.of(context).textTheme.subhead,
        );

  /// 渲染内容
  List<Widget> _renderContents(BuildContext context) {
    final content = <Widget>[];

    // 处理标题部分
    if (head != null) {
      if (head == true) {
        content.add(const SizedBox(
          height: 12,
        ));
      } else if (head is String && (head as String).isNotEmpty) {
        content.add(_headWidget(context));
      } else {
        _logger.warning('Illegal \'head\' in paragraph config: $head');
      }
    }

    // 处理段落部分
    if (text is String) {
      // 单个段落
      content.add(_ParagraphWidget(
        text as String,
        align,
        verticalPadding: 8,
        selectable: selectable,
      ));
    } else {
      // 多个段落
      content.addAll(
          List.of((text as List).map<Widget>((dynamic item) => _ParagraphWidget(
                item as String,
                align,
                selectable: selectable,
              ))));
    }

    // 处理图片部分
    if (src != null && src.isNotEmpty) content.add(MyImage(src));

    return content;
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _renderContents(context),
      ));
}
