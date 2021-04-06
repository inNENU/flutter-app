import 'package:flutter/material.dart';

import 'package:innenu/widgets/components/components.dart';

class DocTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Doc 测试'),
      ),
      body: ListView(children: [
        const TitleComponent('Doc组件'),
        DocComponent(
            '学生违纪惩处办法.docx', 'https://mp.innenu.com/file/xsc/way.docx'),
      ]));
}
