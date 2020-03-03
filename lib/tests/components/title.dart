import 'package:flutter/material.dart';

import 'package:innenu/components/index.dart';

class TitleTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Title 测试'),
      ),
      body: ListView(children: [
        MyTitle('标题测试'),
      ]));
}
