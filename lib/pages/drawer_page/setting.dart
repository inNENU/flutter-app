import 'package:flutter/material.dart';

import '../../components/index.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: [
          MyParagraph('设置页'),
        ],
      ));
}
