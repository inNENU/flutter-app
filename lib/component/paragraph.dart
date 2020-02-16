import 'package:flutter/material.dart';
import './jsonTools.dart';

class MyParagraph extends StatelessWidget {
  /// 段落文字
  final String text;

  /// 文字对齐方式
  final String align;

  MyParagraph(this.text, {this.align = 'justify'});
  MyParagraph.fromJson(Map<String, String> config)
      : assert(config['text'] != null),
        text = config['text'],
        align = config['align'] ?? 'justify';

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
