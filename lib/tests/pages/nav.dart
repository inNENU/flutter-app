import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class HeadTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Nav 测试'),
      ),
      body: ListView(
        children: const [
          SizedBox(
            height: 20,
          ),
          NavComponent('标题'),
        ],
      ));
}
