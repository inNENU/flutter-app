import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class TitleTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Title 测试'),
      ),
      body: ListView(children: [
        TitleComponent('标题测试'),
      ]));
}
