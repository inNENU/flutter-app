import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:innenu/widgets/components/get_page.dart';
import 'package:innenu/widgets/components/page/page.dart';
import 'package:innenu/router/router.dart';
import 'package:innenu/utils/json_tools.dart';
import 'package:innenu/utils/ui/route_animation.dart';

part 'grid.g.dart';

/// 列表配置
@JsonSerializable()
class GridComponentConfig {
  GridComponentConfig({
    this.text = '',
    this.icon = '',
    this.path,
    this.url,
  });
  factory GridComponentConfig.fromJson(Map<String, dynamic> json) =>
      _$GridComponentConfigFromJson(json);

  /// 列表文字
  @JsonKey(defaultValue: '')
  final String text;

  /// 列表图标
  @JsonKey(defaultValue: '')
  final String icon;

  /// 链接文件 ID
  final String path;

  /// 跳转地址
  final String url;

  /// 是否可点击
  bool get isTapable => path != null || url != null;

  /// 点击动作
  void Function() tapAction(BuildContext context) => () {
        if (path != null) {
          getPageFromId(path).then<void>((MyPage page) {
            Navigator.push<dynamic>(context, SlidePageRoute<dynamic>(page));
          });
        } else if (url != null) {
          Routes.router
              .navigateTo(context, url, transition: TransitionType.inFromRight);
        }
      };

  Map<String, dynamic> toJson() => _$GridComponentConfigToJson(this);
}

@JsonSerializable()
class GridComponent extends StatelessWidget {
  const GridComponent(this.content, {this.header, this.footer = ''});

  factory GridComponent.fromJson(Map<String, dynamic> json) =>
      _$GridComponentFromJson(json);

  /// 段落内容
  @JsonKey(fromJson: _getContentFromJson)
  final List<GridComponentConfig> content;

  /// 列表标题
  final dynamic header;

  /// 列表页脚
  @JsonKey(defaultValue: '')
  final String footer;

  /// 每行个数
  int get itemsPerLine => 4;

  Map<String, dynamic> toJson() => _$GridComponentToJson(this);

  /// 从 JSON 生成 content
  static List<GridComponentConfig> _getContentFromJson(List<dynamic> content) =>
      content
          .map<GridComponentConfig>((dynamic item) =>
              GridComponentConfig.fromJson(item as Map<String, dynamic>))
          .toList();

  /// 网格 Widget
  Widget _gridWidget(BuildContext context, GridComponentConfig config) =>
      Column(
        children: [
          // 图标
          Container(
            margin: const EdgeInsets.only(top: 8, bottom: 4),
            child: JSONTools.getIconWidget(config.icon, 40) ??
                const Icon(Icons.error, size: 40),
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
      children: _children(context));
}
