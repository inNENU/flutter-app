import 'package:flutter/material.dart';

class MyHead extends StatelessWidget {
  /// 页面标题
  final String title;

  MyHead({@required this.title});

  @override
  Widget build(BuildContext context) => AppBar(
        title: Text(this.title),
      );
}
