import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../utils/index.dart';
import '../getPage.dart';
import '../jsonTools.dart';

part 'grid.g.dart';

/// 列表配置
@JsonSerializable()
class MyGridConfig {
  /// 列表文字
  @JsonKey(defaultValue: '')
  final String text;

  /// 列表图标
  @JsonKey(defaultValue: '')
  final String icon;

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

  MyGridConfig({
    this.text = '',
    this.icon = '',
    this.aim,
    this.url,
  });
  factory MyGridConfig.fromJson(Map<String, dynamic> json) =>
      _$MyGridConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MyGridConfigToJson(this);
}

@JsonSerializable()
class MyGrid extends StatelessWidget {
  /// 段落内容
  @JsonKey(fromJson: _getContentFromJson)
  final List<MyGridConfig> content;

  /// 列表标题
  final dynamic head;

  /// 列表页脚
  @JsonKey(defaultValue: '')
  final String foot;

  /// 每行个数
  final int itemsPerLine = 4;

  MyGrid(this.content, {this.head, this.foot = ''});
  factory MyGrid.fromJson(Map<String, dynamic> json) => _$MyGridFromJson(json);

  Map<String, dynamic> toJson() => _$MyGridToJson(this);

  /// 从 JSON 生成 content
  static List<MyGridConfig> _getContentFromJson(List<dynamic> content) =>
      List.generate(
        content.length,
        (index) =>
            MyGridConfig.fromJson(content[index] as Map<String, dynamic>),
      );

  /// 网格 Widget
  Widget _gridWidget(BuildContext context, MyGridConfig config) => Column(
        children: [
          // 图标
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: JSONTools.getIconWidget(config.icon, 40) ??
                Icon(Icons.error, size: 40),
          ),

          // 文字
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              config.text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
      );

  /// 获取渲染的项
  Widget _gridTile(BuildContext context, int index) {
    if (index < content.length) {
      final config = content[index];

      return Expanded(
        child: config.isTapable
            ? InkWell(
                onTap: config.tapAction(context),
                child: _gridWidget(context, config),
              )
            : _gridWidget(context, config),
      );
    }

    return Expanded(child: Container());
  }

  /// 渲染的行列表
  Widget _rowWidget(BuildContext context, int startIndex, int length) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          length,
          (index) => _gridTile(context, startIndex + index),
        ),
      );

  /// 渲染的列表
  Widget _gridListWidget(BuildContext context) {
    /// Grid 元素个数
    final itemNumber = content.length;

    /// 行数
    final rowNumber = (itemNumber / itemsPerLine).ceil();

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        children: List.generate(
          rowNumber,
          (index) => _rowWidget(
            context,
            index * itemsPerLine,
            itemsPerLine,
          ),
        ),
      ),
    );
  }

  List<Widget> _children(BuildContext context) {
    final children = [_gridListWidget(context)];

    if (head is String) {
      children.insert(0, JSONTools.cardHead(context, head as String));
    }

    if (foot.isNotEmpty) children.add(JSONTools.cardFoot(context, foot));

    return children;
  }

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _children(context));
}
