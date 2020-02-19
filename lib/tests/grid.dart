import 'package:flutter/material.dart';

import '../components/index.dart';

class GridTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Grid 测试'),
      ),
      body: ListView(
        children: [
          MyGrid([
            MyGridConfig(text: '列表项1'),
            MyGridConfig(text: '列表项2'),
            MyGridConfig(text: '列表项3'),
            MyGridConfig(text: '列表项4'),
          ]),
        ],
      ));
}
