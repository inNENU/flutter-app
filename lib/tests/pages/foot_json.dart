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
          const TitleComponent('包含时间的页脚'),
          FooterComponent.fromJson(const <String, String>{'time': '2020/1/1'}),
          const TitleComponent('去除作者的页脚'),
          FooterComponent.fromJson(const <String, String>{'author': ''}),
          const TitleComponent('其他作者的页脚'),
          FooterComponent.fromJson(const <String, String>{'author': 'Ms.Hope'}),
          const TitleComponent('包含描述的页脚'),
          FooterComponent.fromJson(
              const <String, String>{'desc': '页脚描述页脚描述页脚描述'}),
          const TitleComponent('包含多行描述的页脚'),
          FooterComponent.fromJson(const <String, String>{
            'desc': '页脚描述\n'
                '页脚描述\n'
                '页脚描述',
          }),
          const TitleComponent('只含描述的页脚'),
          FooterComponent.fromJson(const <String, String>{
            'author': '',
            'desc': '页脚描述页脚描述页脚描述',
          }),
        ],
      ));
}
