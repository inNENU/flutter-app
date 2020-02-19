import 'package:flutter/material.dart';

import '../components/index.dart';

class FootTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Foot 测试'),
      ),
      body: ListView(
        children: [
          MyTitle('包含时间的页脚'),
          MyFoot(time: '2020/1/1'),
          MyTitle('去除作者的页脚'),
          MyFoot(author: ''),
          MyTitle('其他作者的页脚'),
          MyFoot(author: 'Ms.Hope'),
          MyTitle('包含描述的页脚'),
          MyFoot(desc: '页脚描述页脚描述页脚描述'),
          MyTitle('包含多行描述的页脚'),
          MyFoot(
            desc: '页脚描述\n'
                '页脚描述\n'
                '页脚描述',
          ),
          MyTitle('只含描述的页脚'),
          MyFoot(author: '', desc: '页脚描述页脚描述页脚描述'),
        ],
      ));
}
