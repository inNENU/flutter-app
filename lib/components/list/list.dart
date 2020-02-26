import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/index.dart';
import '../getPage.dart';
import '../jsonTools.dart';

part 'list.g.dart';

/// 列表配置
@JsonSerializable()
class MyListConfig {
  /// 列表文字
  @JsonKey(defaultValue: '')
  final String text;

  /// 列表图标
  @JsonKey(defaultValue: '')
  final String icon;

  /// 列表详情
  final String desc;

  /// 列表目标
  final String aim;

  /// 跳转地址
  final String url;

  /// 是否可点击
  bool get isTapable => aim != null || url != null;

  /// 点击动作
  void Function() tapAction(BuildContext context) => () {
        if (aim != null) {
          getPageFromAim(aim).then<void>((page) {
            Navigator.push<dynamic>(context, SlidePageRoute<dynamic>(page));
          });
        } else if (url != null) Navigator.pushNamed(context, url);
      };

  MyListConfig(
    this.text, {
    this.icon = '',
    this.desc,
    this.aim,
    this.url,
  });
  factory MyListConfig.fromJson(Map<String, dynamic> json) =>
      _$MyListConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MyListConfigToJson(this);
}

/// 列表组件
@JsonSerializable()
class MyList extends StatelessWidget {
  /// 段落内容
  @JsonKey(fromJson: _getContentFromJson)
  final List<MyListConfig> content;

  /// 列表标题
  final dynamic head;

  /// 列表页脚
  @JsonKey(defaultValue: '')
  final String foot;

  MyList(this.content, {this.head, this.foot = ''});
  factory MyList.fromJson(Map<String, dynamic> json) => _$MyListFromJson(json);

  Map<String, dynamic> toJson() => _$MyListToJson(this);

  /// 从 JSON 生成 content
  static List<MyListConfig> _getContentFromJson(List<dynamic> content) =>
      content
          .map<MyListConfig>((dynamic item) =>
              MyListConfig.fromJson(item as Map<String, dynamic>))
          .toList();

  /// 获取渲染的列表项
  Widget _listTile(BuildContext context, MyListConfig config) => ListTile(
        onTap: config.isTapable ? config.tapAction(context) : null,
        leading: JSONTools.getIconWidget(config.icon),
        title: Text(config.text),
        subtitle: config.desc == null ? null : Text(config.desc),
        trailing: config.isTapable ? const Icon(Icons.chevron_right) : null,
      );

  /// 列表组件
  Widget _listWidget(BuildContext context) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        children:
            content.map<Widget>((item) => _listTile(context, item)).toList(),
      ));

  List<Widget> _children(BuildContext context) {
    final children = [_listWidget(context)];

    if (head is String) {
      children.insert(0, JSONTools.cardHead(context, head as String));
    }

    if (foot.isNotEmpty) children.add(JSONTools.cardFoot(context, foot));

    return children;
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _children(context),
      );
}
