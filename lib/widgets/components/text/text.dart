import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';

import 'package:innenu/utils/json_tools.dart';

part 'text.g.dart';

final _logger = Logger('component.paragraph');

/// 单个段落组件
class _TextWidget extends StatelessWidget {
  const _TextWidget(
    this.text,
    this.textAlign, {
    this.verticalPadding = 4,
    this.selectable = true,
  });

  /// 段落文字
  final String text;

  /// 段落文字对齐方式
  final TextAlign textAlign;

  /// 段落竖直边距
  final double verticalPadding;

  /// 段落文字是否可选中
  final bool selectable;

  /// 文字组件
  Widget _textWidget(BuildContext context) => selectable
      ? SelectableText(
          text,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: textAlign,
        )
      : Text(
          text,
          style: Theme.of(context).textTheme.bodyText2,
          textAlign: textAlign,
        );

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: _textWidget(context));
}

/// 段落组件
@JsonSerializable()
class TextComponent extends StatelessWidget {
  const TextComponent(
    this.text, {
    this.heading,
    this.align = TextAlign.justify,
    this.selectable = true,
    this.src,
    this.desc,
  });
  factory TextComponent.fromJson(Map<String, dynamic> json) =>
      _$TextComponentFromJson(json);

  /// 文字
  ///
  /// 可以是 `String` 或 `List<String>`。后者会显示多个段落。
  @JsonKey(defaultValue: '')
  final dynamic text;

  /// 标题
  final String heading;

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

  Map<String, dynamic> toJson() => _$TextComponentToJson(this);

  /// 标题组件
  Widget _headWidget(BuildContext context) => selectable
      ? SelectableText(
          heading,
          style: Theme.of(context).textTheme.subtitle1,
        )
      : Text(
          heading,
          style: Theme.of(context).textTheme.subtitle1,
        );

  /// 渲染内容
  List<Widget> _renderContents(BuildContext context) {
    final content = <Widget>[];

    // 处理标题部分
    if (heading != null) {
      if (heading.isNotEmpty) {
        content.add(_headWidget(context));
      } else {
        _logger.warning('Illegal "head" in paragraph config: $heading');
      }
    }

    // 处理段落部分
    if (text is String) {
      // 单个段落
      content.add(_TextWidget(
        text as String,
        align,
        verticalPadding: 8,
        selectable: selectable,
      ));
    } else {
      // 多个段落
      content.addAll(
        (text as List)
            .map<Widget>((dynamic item) => _TextWidget(
                  item as String,
                  align,
                  selectable: selectable,
                ))
            .toList(),
      );
    }

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
