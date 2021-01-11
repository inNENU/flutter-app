import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class GridJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Grid JSON 测试'),
      ),
      body: ListView(
        children: [
          GridComponent.fromJson(const <String, dynamic>{
            'content': [
              {'text': '网格项1'},
              {'text': '网格项2'},
              {'text': '网格项3'},
              {'text': '网格项4'},
            ]
          }),
          GridComponent.fromJson(const <String, dynamic>{
            'head': '网格标题',
            'content': [
              {'text': '网格项1'},
              {'text': '网格项2'},
              {'text': '网格项3'},
              {'text': '网格项4'},
            ],
            'foot': '网格脚注',
          }),
          GridComponent.fromJson(const <String, dynamic>{
            'head': '网格标题',
            'content': [
              {
                'icon': '/module/icon/score.svg',
                'text': 'Head 测试',
                'url': '/test/head',
              },
              {
                'icon': '/module/icon/score.svg',
                'text': 'Title 测试',
                'url': '/test/title',
              },
              {
                'icon': '/module/icon/score.svg',
                'text': 'List 测试',
                'url': '/test/list',
              },
              {
                'icon': '/module/icon/score.svg',
                'text': 'Image 测试',
                'url': '/test/image',
              },
              {
                'icon': '/module/icon/score.svg',
                'text': 'Foot 测试',
                'url': '/test/foot',
              },
            ],
            'foot': '网格脚注',
          }),
        ],
      ));
}
