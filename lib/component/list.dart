import 'package:flutter/material.dart';

/// 列表配置
class MyListConfig {
  /// 列表文字
  String text;

  /// 列表目标
  String aim;

  /// 列表图标
  String icon;

  /// 列表详情
  String desc;

  MyListConfig({this.text, this.aim, this.icon});
}

class MyList extends StatelessWidget {
  /// 段落内容
  final List<MyListConfig> content;

  MyList({@required this.content});

  /// 获取渲染的列表项
  Widget _getListTile(num index) {
    MyListConfig config = this.content[index];

    return ListTile(title: Text(config.text));
  }

  /// 渲染的列表
  List<Widget> _getList() =>
      List.generate(this.content.length, (index) => _getListTile(index));

  @override
  Widget build(BuildContext context) => ListView(children: _getList());
}
