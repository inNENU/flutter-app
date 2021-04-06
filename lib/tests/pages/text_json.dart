import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class TextJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Paragraph JSON 测试'),
        ),
        body: ListView(
          children: [
            TextComponent.fromJson(
                const <String, String>{'tag': 'p', 'text': '段落1文字'}),
            TextComponent.fromJson(const <String, String>{
              'tag': 'p',
              'head': '标题文字',
              'text': '带标题的段落文字',
            }),
            TextComponent.fromJson(const <String, String>{
              'tag': 'p',
              'text': '带有换行的段落文字\n'
                  '带有换行的段落文字',
            }),
            TextComponent.fromJson(const <String, dynamic>{
              'tag': 'p',
              'text': '左对齐的段落文字',
              'align': 'left',
            }),
            TextComponent.fromJson(const <String, dynamic>{
              'tag': 'p',
              'text': '右对齐的段落文字',
              'align': 'right',
            }),
            TextComponent.fromJson(const <String, dynamic>{
              'tag': 'p',
              'text': '居中的段落文字',
              'align': 'center',
            }),
            TextComponent.fromJson(const <String, String>{
              'tag': 'p',
              'text': '非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的段落3',
            }),
            TextComponent.fromJson(const <String, dynamic>{
              'tag': 'p',
              'text': [
                '   多个段落a',
                '   多个段落b',
                '   非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
              ],
            }),
            TextComponent.fromJson(const <String, dynamic>{
              'tag': 'p',
              'head': '标题文字',
              'text': [
                '   带标题的多个段落a',
                '   带标题的多个段落b',
                '   带标题的非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常'
                    '非常非常非常非常非常非常非常非常长的多个段落c'
              ],
            }),
            TextComponent.fromJson(const <String, dynamic>{
              'tag': 'p',
              'text': [
                '   居中的多个段落a',
                '   居中的多个段落b',
                '   居中的非常非常非常非常非常非常非常非常非常非常非常非常非常'
                    '非常非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
              ],
              'align': 'center'
            }),
            TextComponent.fromJson(const <String, dynamic>{
              'tag': 'p',
              'text': [
                '右对齐的多个段落a',
                '右对齐的多个段落b',
                '右对齐的非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常非常长的多个段落c'
              ],
              'align': 'right'
            }),
          ],
        ),
      );
}
