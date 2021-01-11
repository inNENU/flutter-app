import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class HeadJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Nav JSON 测试'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          NavComponent.fromJson(
              const <String, String>{'tag': 'head', 'title': '标题'}),
        ],
      ));
}
