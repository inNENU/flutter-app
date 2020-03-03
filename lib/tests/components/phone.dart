import 'package:flutter/material.dart';

import 'package:innenu/components/index.dart';

class PhoneTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Phone 测试'),
      ),
      body: ListView(children: [
        MyPhone(
          '12344556677',
          '伯望',
          familyName: 'A测试',
        ),
      ]));
}
