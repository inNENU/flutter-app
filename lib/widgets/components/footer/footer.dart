import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'footer.g.dart';

/// 标题组件
@JsonSerializable()
class FooterComponent extends StatelessWidget {
  const FooterComponent({
    this.author = '',
    this.time = '',
    this.desc = '',
  });
  factory FooterComponent.fromJson(Map<String, dynamic> json) =>
      _$FooterComponentFromJson(json);

  /// 作者
  @JsonKey(defaultValue: '')
  final String author;

  /// 时间
  @JsonKey(defaultValue: '')
  final String time;

  /// 页脚文字
  @JsonKey(defaultValue: '')
  final String desc;

  Map<String, dynamic> toJson() => _$FooterComponentToJson(this);

  static const TextStyle _style = TextStyle(
      color: Color(0xff888888),
      fontSize: 12,
      height: 1.333333333333333,
      letterSpacing: -0.1);

  /// 页脚信息
  Widget? _getInfoWidget(BuildContext context) {
    final info = <Widget>[
      // 作者
      ...author.isNotEmpty
          ? [
              Text(
                '作者: $author',
                style: _style,
              )
            ]
          : [],
      // 时间
      ...time.isNotEmpty
          ? [
              Text(
                '最后更新于: $time',
                style: _style,
              ),
            ]
          : []
    ];

    return info.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: info,
            ))
        : null;
  }

  /// 版权 Widget
  Widget _getCopyRightWidget(BuildContext context) => const Text(
        'Copyright © 2017 - present Hope Studio',
        style: _style,
      );

  /// 页脚组件
  List<Widget> _getContent(BuildContext context) {
    final content = [_getCopyRightWidget(context)];
    final infoWidget = _getInfoWidget(context);

    // 插入作者与时间
    if (infoWidget != null) {
      content.insert(0, infoWidget);
    }

    // 插入描述文字
    if (desc.isNotEmpty) {
      content.insert(
          0,
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              desc,
              style: Theme.of(context).textTheme.overline,
            ),
          ));
    }

    return content;
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
      child: Column(children: _getContent(context)));
}
