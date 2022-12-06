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
    super.key,
  });
  factory FooterComponent.fromJson(Map<String, dynamic> json) =>
      _$FooterComponentFromJson(json);

  /// 作者
  final String author;

  /// 时间
  final String time;

  /// 页脚文字
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
      if (author.isNotEmpty)
        Text(
          '作者: $author',
          style: _style,
        ),

      // 时间
      if (time.isNotEmpty)
        Text(
          '最后更新于: $time',
          style: _style,
        ),
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

  /// 页脚组件
  List<Widget> _getContent(BuildContext context) {
    final infoWidget = _getInfoWidget(context);

    return [
      // 描述
      if (desc.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            desc,
            style: _style,
          ),
        ),

      /// 信息
      if (infoWidget != null) infoWidget,

      /// 版权
      const Text(
        'Copyright © 2017 - present Hope Studio',
        style: _style,
      )
    ];
  }

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 15, 20),
      child: Column(children: _getContent(context)));
}
