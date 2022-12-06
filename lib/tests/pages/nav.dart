import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class HeadTest extends StatelessWidget {
  const HeadTest({super.key});

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
