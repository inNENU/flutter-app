import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

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
              style: Theme.of(context).textTheme.headline4,
            ),
            const TextComponent(
              text: [
                '制作者: Mr.Hope',
                '版本: V 0.0.1',
                'Copyright © 2017 - present Hope Studio'
              ],
              align: TextAlign.center,
            ),
          ],
        ),
      );
}
