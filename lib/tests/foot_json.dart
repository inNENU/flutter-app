import 'package:flutter/material.dart';

import '../components/index.dart';

class FootJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Foot JSON 测试'),
      ),
      body: ListView(
        children: [
          MyTitle('包含时间的页脚'),
          MyFoot.fromJson(<String, String>{'time': '2020/1/1'}),
          MyTitle('去除作者的页脚'),
          MyFoot.fromJson(<String, String>{'author': ''}),
          MyTitle('其他作者的页脚'),
          MyFoot.fromJson(<String, String>{'author': 'Ms.Hope'}),
          MyTitle('包含描述的页脚'),
          MyFoot.fromJson(<String, String>{'desc': '页脚描述页脚描述页脚描述'}),
          MyTitle('包含多行描述的页脚'),
          MyFoot.fromJson(<String, String>{
            'desc': '页脚描述\n'
                '页脚描述\n'
                '页脚描述',
          }),
          MyTitle('只含描述的页脚'),
          MyFoot.fromJson(<String, String>{
            'author': '',
            'desc': '页脚描述页脚描述页脚描述',
          }),
        ],
      ));
}
