import 'package:flutter/material.dart';

import '../components/index.dart';

class HeadJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Head JSON 测试'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          MyHead.fromJson(<String, String>{'tag': 'head', 'title': '标题'}),
        ],
      ));
}
