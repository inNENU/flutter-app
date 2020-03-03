import 'package:flutter/material.dart';

import 'package:innenu/components/index.dart';

class ImageJSONTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Image JSON 测试'),
      ),
      body: ListView(
        children: [
          MyParagraph('普通图片'),
          MyImage.fromJson(<String, String>{
            'tag': 'img',
            'src': 'https://mp.innenu.com/img/check/check1.jpg',
          }),
          MyParagraph('包含描述文字的图片'),
          MyImage.fromJson(<String, String>{
            'tag': 'img',
            'src': 'https://mp.innenu.com/img/check/check2.jpg',
            'desc': '报道图片1',
          }),
          MyParagraph('包含大量描述文字的图片'),
          MyImage.fromJson(<String, String>{
            'tag': 'img',
            'src': 'https://mp.innenu.com/img/check/check2.jpg',
            'desc': '报道图片1报道图片1报道图片1报道图片1报道图片1报道图片1报道图片1报道图片1报道图片1',
          }),
          MyParagraph('包含多行描述文字的图片'),
          MyImage.fromJson(<String, String>{
            'tag': 'img',
            'src': 'https://mp.innenu.com/img/check/check1.jpg',
            'desc': '报道图片1\n' '报道图片1',
          }),
          MyParagraph('加载失败图片'),
          MyImage.fromJson(<String, String>{
            'tag': 'img',
            'src': 'https://mp.innenu.com/img/check/acheck1.jpg',
          }),
        ],
      ));
}
