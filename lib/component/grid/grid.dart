import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grid.g.dart';

/// 列表配置
@JsonSerializable()
class MyGridConfig {
  /// 列表文字
  @JsonKey(required: true)
  final String text;

  /// 列表图标
  @JsonKey(required: true)
  final String icon;

  /// 列表目标
  final String aim;

  /// 跳转地址
  final String url;

  MyGridConfig({@required this.text, @required this.icon, this.aim, this.url});
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
  final dynamic foot;

  MyGrid(this.content, {this.head, this.foot});
  factory MyGrid.fromJson(Map<String, dynamic> json) => _$MyGridFromJson(json);

  Map<String, dynamic> toJson() => _$MyGridToJson(this);

  /// 从 JSON 生成 content
  static List<MyGridConfig> _getContentFromJson(
          List<Map<String, String>> content) =>
      List.generate(
          content.length, (index) => MyGridConfig.fromJson(content[index]));

  /// 获取渲染的项
  Widget _getGridTile(int index) {
    MyGridConfig config = this.content[index];

    List<Widget> children = [Text(config.text)];

    if (config.icon != null) {
      children.insert(0, CachedNetworkImage(imageUrl: config.icon));
    }

    return GridTile(child: Column(children: children));
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
