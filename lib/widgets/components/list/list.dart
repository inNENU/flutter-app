import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:innenu/widgets/components/get_page.dart';
import 'package:innenu/utils/json_tools.dart';
import 'package:innenu/utils/ui/route_animation.dart';
import 'package:innenu/router/router.dart';

part 'list.g.dart';

/// 列表配置
@JsonSerializable()
class ListComponentConfig {
  ListComponentConfig(
    this.text, {
    this.icon = '',
    this.desc,
    this.path,
    this.url,
  });
  factory ListComponentConfig.fromJson(Map<String, dynamic> json) =>
      _$ListComponentConfigFromJson(json);

  /// 列表文字
  @JsonKey(defaultValue: '')
  final String text;

  /// 列表图标
  @JsonKey(defaultValue: '')
  final String icon;

  /// 列表详情
  final String desc;

  /// 列表文件路径
  final String path;

  /// 跳转地址
  final String url;

  /// 是否可点击
  bool get isTapable => path != null || url != null;

  /// 点击动作
  void Function() tapAction(BuildContext context) => () {
        if (path != null) {
          getPageFromId(path).then<void>((page) {
            Navigator.push<dynamic>(context, SlidePageRoute<dynamic>(page));
          });
        } else if (url != null) {
          Routes.router
              .navigateTo(context, url, transition: TransitionType.inFromRight);
        }
      };

  Map<String, dynamic> toJson() => _$ListComponentConfigToJson(this);
}

/// 列表组件
@JsonSerializable()
class ListComponent extends StatelessWidget {
  const ListComponent(this.content, {this.header, this.footer = ''});
  factory ListComponent.fromJson(Map<String, dynamic> json) =>
      _$ListComponentFromJson(json);

  /// 段落内容
  @JsonKey(fromJson: _getContentFromJson)
  final List<ListComponentConfig> content;

  /// 列表标题
  final dynamic header;

  /// 列表页脚
  @JsonKey(defaultValue: '')
  final String footer;

  Map<String, dynamic> toJson() => _$ListComponentToJson(this);

  /// 从 JSON 生成 content
  static List<ListComponentConfig> _getContentFromJson(List<dynamic> content) =>
      content
          .map<ListComponentConfig>((dynamic item) =>
              ListComponentConfig.fromJson(item as Map<String, dynamic>))
          .toList();

  /// 获取渲染的列表项
  Widget _listTile(BuildContext context, ListComponentConfig config) =>
      ListTile(
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

    if (header is String) {
      children.insert(0, JSONTools.cardHead(context, header as String));
    }

    if (footer.isNotEmpty) {
      children.add(JSONTools.cardFoot(context, footer));
    }

    return children;
  }

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _children(context),
      );
}
