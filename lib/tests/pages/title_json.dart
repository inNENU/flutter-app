import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class TitleJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Title JSON 测试'),
      ),
      body: ListView(children: [
        TitleComponent.fromJson(
            const <String, String>{'tag': 'title', 'text': '标题测试'}),
      ]));
}
