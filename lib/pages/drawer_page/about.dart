import 'package:flutter/material.dart';

import '../../components/index.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('关于'),
        ),
        body: ListView(
          children: [
            Text(
              'in东师',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.display1,
            ),
            MyParagraph(
              '制作者: Mr.Hope',
              align: TextAlign.center,
            ),
            MyParagraph(
              '版本: V 0.0.1',
              align: TextAlign.center,
            ),
            MyParagraph(
              'Copyright © 2017 - present Hope Studio',
              align: TextAlign.center,
            ),
          ],
        ),
      );
}
