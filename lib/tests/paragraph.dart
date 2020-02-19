import 'package:flutter/material.dart';

import '../components/index.dart';

class ParagraphTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Paragraph 测试'),
        ),
        body: ListView(
          children: [
            MyParagraph('段落1文字'),
            MyParagraph(
              '段落2文字，包含图片',
              src: 'https://mp.innenu.com/img/check/check1.jpg',
            ),
            MyParagraph(
              '带标题的段落文字',
              head: '标题文字',
            ),
            MyParagraph(
              '段落前留空的的段落文字',
              head: true,
            ),
            MyParagraph(
              '左对齐的段落文字',
              align: TextAlign.left,
            ),
            MyParagraph(
              '右对齐的段落文字',
              align: TextAlign.right,
            ),
            MyParagraph(
              '居中的段落文字',
              align: TextAlign.center,
            ),
            MyParagraph(
                '非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的段落3'),
            MyParagraph([
              '   多个段落a',
              '   多个段落b',
              '   非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
            ]),
            MyParagraph(
              [
                '   带标题的多个段落a',
                '   带标题的多个段落b',
                '   带标题的非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常'
                    '非常非常非常非常非常非常非常非常长的多个段落c'
              ],
              head: '标题文字',
            ),
            MyParagraph([
              '   居中的多个段落a',
              '   居中的多个段落b',
              '   居中的非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
            ], align: TextAlign.center),
            MyParagraph([
              '右对齐的多个段落a',
              '右对齐的多个段落b',
              '右对齐的非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
            ], align: TextAlign.right),
            const SizedBox(
              height: 20,
            ),
            MyParagraph(
              [
                '   包含图片的多个段落a'
                    '   包含图片的多个段落b',
                '   包含图片的非常非常非常非常非常非常非常非常非常非常非常非常非常非常'
                    '非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
              ],
              src: 'https://mp.innenu.com/img/check/check1.jpg',
            ),
          ],
        ),
      );
}
