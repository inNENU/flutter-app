import 'package:flutter/material.dart';

import '../components/index.dart';

class TitleTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        MyHead('设置'),
        MyTitle('标题测试'),
      ]));
}
