import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class ListTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('List 测试'),
      ),
      body: ListView(
        children: [
          ListComponent([
            ListComponentConfig('列表项1'),
            ListComponentConfig('列表项2'),
            ListComponentConfig('列表项3'),
            ListComponentConfig('列表项4'),
          ]),
          ListComponent(
            [
              ListComponentConfig('列表项1'),
              ListComponentConfig('列表项2'),
              ListComponentConfig('列表项3'),
              ListComponentConfig('列表项4'),
            ],
            header: '列表标题',
            footer: '列表脚注',
          ),
          ListComponent([
            ListComponentConfig('列表项1', desc: '列表1的详细描述'),
            ListComponentConfig('列表项2', desc: '列表2的详细描述'),
            ListComponentConfig('列表项3', desc: '列表3的详细描述'),
            ListComponentConfig('列表项4', desc: '列表4的详细描述'),
          ]),
          ListComponent([
            ListComponentConfig('title 测试', url: '/test/title'),
            ListComponentConfig('paragraph 测试', url: '/test/paragraph'),
            ListComponentConfig('image 测试', url: '/test/image'),
          ]),
          ListComponent([
            ListComponentConfig(
              'title 测试',
              desc: 'title 测试的详细描述',
              url: '/test/title',
            ),
            ListComponentConfig(
              'paragraph 测试',
              desc: 'paragraph 测试的详细描述',
              url: '/test/paragraph',
            ),
            ListComponentConfig(
              'image 测试',
              desc: 'image 测试的详细描述',
              url: '/test/image',
            ),
          ]),
        ],
      ));
}
