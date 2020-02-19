import 'package:flutter/material.dart';

import '../components/index.dart';

class ListTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('List 测试'),
      ),
      body: ListView(
        children: [
          MyList([
            MyListConfig('列表项1'),
            MyListConfig('列表项2'),
            MyListConfig('列表项3'),
            MyListConfig('列表项4'),
          ]),
          MyList([
            MyListConfig('列表项1', desc: '列表1的详细描述'),
            MyListConfig('列表项2', desc: '列表2的详细描述'),
            MyListConfig('列表项3', desc: '列表3的详细描述'),
            MyListConfig('列表项4', desc: '列表4的详细描述'),
          ]),
          MyList([
            MyListConfig('title 测试', url: '/test/title'),
            MyListConfig('paragraph 测试', url: '/test/paragraph'),
            MyListConfig('image 测试', url: '/test/image'),
          ]),
          MyList([
            MyListConfig(
              'title 测试',
              desc: 'title 测试的详细描述',
              url: '/test/title',
            ),
            MyListConfig(
              'paragraph 测试',
              desc: 'paragraph 测试的详细描述',
              url: '/test/paragraph',
            ),
            MyListConfig(
              'image 测试',
              desc: 'image 测试的详细描述',
              url: '/test/image',
            ),
          ]),
        ],
      ));
}
