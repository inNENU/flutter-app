import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('设置'),
      ),
      body: ListView(
        children: const [
          TextComponent('设置页'),
        ],
      ));
}
