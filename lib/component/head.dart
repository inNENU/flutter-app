import 'package:flutter/material.dart';

class MyHead extends StatelessWidget {
  /// 页面标题
  final String title;

  MyHead(this.title);
  MyHead.fromJson(Map<String, dynamic> config)
      : title = config['title'] as String;

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(this.title),
      );
}
