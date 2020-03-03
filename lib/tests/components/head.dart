import 'package:flutter/material.dart';

import 'package:innenu/components/index.dart';

class HeadTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Head 测试'),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          MyHead('标题'),
        ],
      ));
}
