import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 列表配置
class MyGridConfig {
  /// 列表文字
  String text;

  /// 列表图标
  String icon;

  /// 列表目标
  String aim;

  /// 跳转地址
  String url;

  MyGridConfig({this.text, this.icon, this.aim, this.url});
  MyGridConfig.fromJson(config)
      : text = config.text,
        icon = config.icon,
        aim = config.aim,
        url = config.url;
}

class MyGrid extends StatelessWidget {
  /// 段落内容
  final List<MyGridConfig> content;

  /// 列表标题
  final dynamic head;

  /// 列表页脚
  final dynamic foot;

  MyGrid(this.content, {this.head, this.foot});
  MyGrid.fromJson(config)
      : content = List.generate(config.content.length,
            (index) => MyGridConfig.fromJson(config.content[index])),
        head = config.head,
        foot = config.foot;

  /// 获取渲染的项
  Widget _getGridTile(num index) {
    MyGridConfig config = this.content[index];

    return GridTile(
        child: Column(children: [
      config.icon == null ? null : CachedNetworkImage(imageUrl: config.icon),
      Text(config.text),
    ]));
  }

  /// 渲染的列表
  List<Widget> _getGrid() =>
      List.generate(this.content.length, (index) => _getGridTile(index));

  @override
  Widget build(BuildContext context) => GridView.count(
        crossAxisCount: 3,
        children: _getGrid(),
      );
}
