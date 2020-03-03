import 'package:flutter/material.dart';

import 'package:innenu/components/index.dart';

class TitleJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Title JSON 测试'),
      ),
      body: ListView(children: [
        MyTitle.fromJson(<String, String>{'tag': 'title', 'text': '标题测试'}),
      ]));
}
