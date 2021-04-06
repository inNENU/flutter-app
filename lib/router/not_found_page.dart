import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('页面不存在'),
      ),
      body: const Center(child: Text('页面不存在')));
}
