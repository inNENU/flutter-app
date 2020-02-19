import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list.g.dart';

/// 列表配置
@JsonSerializable()
class MyListConfig {
  /// 列表文字
  @JsonKey(defaultValue: '')
  final String text;

  /// 列表图标
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
          Navigator.pushNamed(context, '/page');
        } else if (url != null) Navigator.pushNamed(context, url);
      };

  MyListConfig(this.text, {this.icon, this.desc, this.aim, this.url});
  factory MyListConfig.fromJson(Map<String, String> json) =>
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
  final dynamic foot;

  MyList(this.content, {this.head, this.foot});
  factory MyList.fromJson(Map<String, dynamic> json) => _$MyListFromJson(json);

  Map<String, dynamic> toJson() => _$MyListToJson(this);

  /// 从 JSON 生成 content
  static List<MyListConfig> _getContentFromJson(
          List<Map<String, String>> content) =>
      List.generate(
        content.length,
        (index) => MyListConfig.fromJson(content[index]),
      );

  /// 获取渲染的列表项
  Widget _listTile(BuildContext context, int index) {
    final config = content[index];

    return ListTile(
      onTap: config.isTapable ? config.tapAction(context) : null,
      leading: config.icon == null
          ? null
          : CachedNetworkImage(imageUrl: config.icon),
      title: Text(config.text),
      subtitle: config.desc == null ? null : Text(config.desc),
      trailing: config.isTapable ? const Icon(Icons.chevron_right) : null,
    );
  }

  /// 渲染的列表
  List<Widget> _getList(BuildContext context) =>
      List.generate(content.length, (index) => _listTile(context, index));

  @override
  Widget build(BuildContext context) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        children: _getList(context),
      ));
}
