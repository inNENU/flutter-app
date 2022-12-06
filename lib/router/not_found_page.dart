import 'package:flutter/material.dart';

// TODO(Mister-Hope): Improve not found page style
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('页面不存在'),
      ),
      body: const Center(child: Text('页面不存在')));
}
