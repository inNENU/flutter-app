import 'package:flutter/material.dart';

import 'package:innenu/components/index.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [MyHead('设置'), MyParagraph('设置页')]));
}
