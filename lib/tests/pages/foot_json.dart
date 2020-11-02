import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class FootJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Foot JSON 测试'),
      ),
      body: ListView(
        children: [
          TitleComponent('包含时间的页脚'),
          FooterComponent.fromJson(<String, String>{'time': '2020/1/1'}),
          TitleComponent('去除作者的页脚'),
          FooterComponent.fromJson(<String, String>{'author': ''}),
          TitleComponent('其他作者的页脚'),
          FooterComponent.fromJson(<String, String>{'author': 'Ms.Hope'}),
          TitleComponent('包含描述的页脚'),
          FooterComponent.fromJson(<String, String>{'desc': '页脚描述页脚描述页脚描述'}),
          TitleComponent('包含多行描述的页脚'),
          FooterComponent.fromJson(<String, String>{
            'desc': '页脚描述\n'
                '页脚描述\n'
                '页脚描述',
          }),
          TitleComponent('只含描述的页脚'),
          FooterComponent.fromJson(<String, String>{
            'author': '',
            'desc': '页脚描述页脚描述页脚描述',
          }),
        ],
      ));
}
