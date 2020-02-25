import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../index.dart';

final _logger = Logger('page');

class MyPage extends StatelessWidget {
  /// 页面组件
  final List<Widget> pageWidgets;

  MyPage({@required List<Widget> children}) : pageWidgets = children;

  /// 从 JSON 生成 MyPage
  MyPage.fromJson(List<Map<String, dynamic>> pageWidgets)
      : pageWidgets = List<Widget>.generate(
            pageWidgets.length, (index) => _generateWidget(pageWidgets[index]));

  /// 生成 Widget
  static Widget _generateWidget(Map<String, dynamic> config) {
    final tag = config['tag'] as String;

    switch (tag) {
      case 'head':
        // do nothing now
        return const SizedBox();
      case 'title':
        return MyTitle.fromJson(config);
      case 'p':
        return MyParagraph.fromJson(config);
      case 'img':
        return MyImage.fromJson(config);
      case 'grid':
        return MyGrid.fromJson(config);
      case 'list':
        return MyList.fromJson(config);
      case 'foot':
        return MyFoot.fromJson(config);
      default:
        _logger.warning('Unknown compoennt: $tag');
        return const SizedBox();
    }
  }

  // /// 页面组件
  // List<Widget> _pageContents(BuildContext context) {
  //   return [];
  // }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Paragraph 测试'),
      ),
      body: ListView(
        children: pageWidgets,
      ));
}
