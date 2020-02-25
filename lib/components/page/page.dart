import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

import '../index.dart';

final _logger = Logger('page');

class MyPage extends StatelessWidget {
  /// 页面标题
  final String title;

  /// 页面组件
  final List<Widget> pageWidgets;

  MyPage({@required List<Widget> children, @required this.title})
      : pageWidgets = children;

  /// 从 JSON 生成 MyPage
  MyPage.fromJson(List<dynamic> pageWidgets)
      : title = pageWidgets[0]['hidden'] as bool == true
            ? ''
            : pageWidgets[0]['title'] as String ?? '详情',
        pageWidgets = List<Widget>.generate(
            pageWidgets.length,
            (index) =>
                _generateWidget(pageWidgets[index] as Map<String, dynamic>));

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

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: title.isNotEmpty
          ? AppBar(
              title: Text(title),
            )
          : null,
      body: ListView(
        children: pageWidgets,
      ));
}
