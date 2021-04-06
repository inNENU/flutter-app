import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class ListJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('List JSON 测试'),
      ),
      body: ListView(
        children: [
          ListComponent.fromJson(const <String, dynamic>{
            'tag': 'list',
            'content': [
              {'text': '列表项1'},
              {'text': '列表项2'},
              {'text': '列表项3'},
              {'text': '列表项4'},
            ],
          }),
          ListComponent.fromJson(const <String, dynamic>{
            'tag': 'list',
            'head': '列表标题',
            'content': [
              {'text': '列表项1', 'desc': '列表1的详细描述'},
              {'text': '列表项2', 'desc': '列表2的详细描述'},
              {'text': '列表项3', 'desc': '列表3的详细描述'},
              {'text': '列表项4', 'desc': '列表4的详细描述'},
            ],
            'foot': '列表脚注'
          }),
          ListComponent.fromJson(const <String, dynamic>{
            'tag': 'list',
            'content': [
              {
                'text': 'title 测试',
                'desc': 'title 测试的详细描述',
                'url': '/test/titleJSON',
              },
              {
                'text': 'paragraph 测试',
                'desc': 'paragraph 测试的详细描述',
                'url': '/test/paragraphJSON',
              },
              {
                'text': 'image 测试',
                'desc': 'image 测试的详细描述',
                'url': '/test/imageJSON',
              },
            ],
          }),
        ],
      ));
}
