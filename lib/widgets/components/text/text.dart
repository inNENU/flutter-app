import 'package:flutter/material.dart';
import 'package:innenu/utils/json_tools.dart';
import 'package:innenu/utils/tool.dart';
import 'package:json_annotation/json_annotation.dart';

part 'text.g.dart';

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

  @override
  Widget build(BuildContext context) => Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: selectable
          ? SelectableText(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: textAlign,
            )
          : Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: textAlign,
            ));
}

enum TextType { info, tip, warning, danger, none }

/// 获得类型
TextType getTextType(String? type) =>
    stringToEnumMap(TextType.values, defaultValue: TextType.none)(type);

/// 段落组件
@JsonSerializable(includeIfNull: false)
class TextComponent extends StatelessWidget {
  const TextComponent({
    this.text = '',
    this.heading = '',
    this.type = TextType.none,
    this.align = TextAlign.justify,
    this.selectable = true,
    this.src = '',
    this.desc = '',
// super.key,
  });
  factory TextComponent.fromJson(Map<String, dynamic> json) =>
      _$TextComponentFromJson(json);

  /// 文字
  ///
  /// 可以是 `String` 或 `List<String>`。后者会显示多个段落。
  final dynamic text;

  /// 标题
  final String heading;

  /// 文字对齐方式
  ///
  /// 只能是 `'left'`, `'right'`, `'center'` 或 `'justify'` 中的一种
  @JsonKey(fromJson: getAlign)
  final TextAlign align;

  /// 文字类型
  ///
  /// 只能是 `'none'`, `'info'`, `'tip'`, `'warning'` 或 `'danger'` 中的一种
  final TextType type;

  /// 文字是否可以选中
  final bool selectable;

  /// 图片地址
  final String src;

  /// 图片描述文字
  final String desc;

  Map<String, dynamic> toJson() => _$TextComponentToJson(this);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 标题
          if (heading.isNotEmpty)
            selectable
                ? SelectableText(
                    heading,
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                : Text(
                    heading,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

          // 段落
          //
          // 单个段落
          if (text is String)
            _TextWidget(
              text as String,
              align,
              verticalPadding: 8,
              selectable: selectable,
            )
          // 多个段落
          else if (text is List)
            ...(text as List)
                .map<Widget>((dynamic item) => _TextWidget(
                      item as String,
                      align,
                      selectable: selectable,
                    ))
                .toList()
        ],
      ));
}
