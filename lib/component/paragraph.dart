import 'package:flutter/material.dart';

class MyParagraph extends StatelessWidget {
  /// 段落文字
  final String text;

  /// 文字对齐方式
  final String align;

  MyParagraph(this.text, {this.align = 'justify'});
  MyParagraph.fromJson(config)
      : text = config.text ?? '',
        align = config.align ?? 'justify';

  /// 获得对齐方式
  TextAlign _getAlign() {
    Map<String, TextAlign> alignMap = Map();

    TextAlign.values.forEach((item) {
      alignMap[item.toString()] = item;
    });

    return alignMap[this.align];
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Row(children: [
        Expanded(
            child: SelectableText(
          this.text,
          style: Theme.of(context).textTheme.body1,
          textAlign: _getAlign(),
        ))
      ]));
}
