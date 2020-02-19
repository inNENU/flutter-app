import 'package:flutter/material.dart';

import '../components/index.dart';

class ComponentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MyHead('组件页'),
            MyParagraph('组件页'),
          ],
        ),
      );
}
