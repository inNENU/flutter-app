import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// 列表配置
class MyListConfig {
  /// 列表文字
  String text;

  /// 列表图标
  String icon;

  /// 列表详情
  String desc;

  /// 列表目标
  String aim;

  /// 跳转地址
  String url;

  MyListConfig({this.text, this.icon, this.desc, this.aim, this.url});
  MyListConfig.fromJson(config)
      : text = config.text,
        icon = config.icon,
        desc = config.desc,
        aim = config.aim,
        url = config.url;
}

class MyList extends StatelessWidget {
  /// 段落内容
  final List<MyListConfig> content;

  /// 列表标题
  final dynamic head;

  /// 列表页脚
  final dynamic foot;

  MyList(this.content, {this.head, this.foot});
  MyList.fromJson(config)
      : content = List.generate(config.content.length,
            (index) => MyListConfig.fromJson(config.content[index])),
        head = config.head,
        foot = config.foot;

  /// 获取渲染的列表项
  Widget _getListTile(num index) {
    MyListConfig config = this.content[index];

    return ListTile(
        leading: config.icon == null
            ? null
            : CachedNetworkImage(imageUrl: config.icon),
        title: Text(config.text),
        subtitle: config.desc == null ? null : Text(config.desc),
        trailing: config.url == null && config.aim == null
            ? null
            : Icon(Icons.accessible));
  }

  /// 渲染的列表
  List<Widget> _getList() =>
      List.generate(this.content.length, (index) => _getListTile(index));

  @override
  Widget build(BuildContext context) => Card(child: Column(children: _getList()));
}
