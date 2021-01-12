import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class TextTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Paragraph 测试'),
        ),
        body: ListView(
          children: const [
            TextComponent('段落1文字'),
            TextComponent(
              '带标题的段落文字',
              heading: '标题文字',
            ),
            TextComponent(['带有换行的段落文字\n带有换行的段落文字']),
            TextComponent(
              '左对齐的段落文字',
              align: TextAlign.left,
            ),
            TextComponent(
              '右对齐的段落文字',
              align: TextAlign.right,
            ),
            TextComponent(
              '居中的段落文字',
              align: TextAlign.center,
            ),
            TextComponent(
                '非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的段落3'),
            TextComponent([
              '   多个段落a',
              '   多个段落b',
              '   非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
            ]),
            TextComponent(
              [
                '   带标题的多个段落a',
                '   带标题的多个段落b',
                '   带标题的非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常'
                    '非常非常非常非常非常非常非常非常长的多个段落c'
              ],
              heading: '标题文字',
            ),
            TextComponent([
              '   居中的多个段落a',
              '   居中的多个段落b',
              '   居中的非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
            ], align: TextAlign.center),
            TextComponent([
              '右对齐的多个段落a',
              '右对齐的多个段落b',
              '右对齐的非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
            ], align: TextAlign.right),
          ],
        ),
      );
}
