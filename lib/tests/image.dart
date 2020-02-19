import 'package:flutter/material.dart';

import '../components/index.dart';

class ImageTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Image 测试'),
      ),
      body: ListView(
        children: [
          MyParagraph('普通图片'),
          MyImage('https://mp.innenu.com/img/check/check1.jpg'),
          MyParagraph('包含描述文字的图片'),
          MyImage('https://mp.innenu.com/img/check/check1.jpg', '报道图片1'),
          MyParagraph('加载失败图片'),
          MyImage('https://mp.innenu.com/img/check/acheck1.jpg'),
        ],
      ));
}
