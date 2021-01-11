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

  /// 页脚文字
  @JsonKey(defaultValue: '')
  final String desc;

  /// 作者
  @JsonKey(defaultValue: '')
  final String author;

  /// 时间
  @JsonKey(defaultValue: '')
  final String time;

  Map<String, dynamic> toJson() => _$FooterComponentToJson(this);

  /// 页脚文字
  String get footText =>
      // 作者
      (author.isNotEmpty ? '作者: $author' : '') +
      // 分割空格
      (author.isNotEmpty && time.isNotEmpty ? '  ' : '') +
      // 时间
      (time.isNotEmpty ? '最后更新于: $time' : '');

  /// 寄语 Widget
  Widget _subjectWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 20, bottom: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '走出半生，归来仍是',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  '———',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(letterSpacing: -2, wordSpacing: -2),
                ),
              ],
            ),
            Text(
              '东师青年',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      );

  /// 版权 Widget
  Widget _copyRightWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Text(
          'Copyright © 2017 - present Hope Studio',
          style: Theme.of(context).textTheme.overline,
        ),
      );

  /// 页脚组件
  List<Widget> _content(BuildContext context) {
    final content = [_subjectWidget(context), _copyRightWidget(context)];

    // 插入作者与时间
    if (footText.isNotEmpty) {
      content.insert(
        1,
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            footText,
            style: Theme.of(context).textTheme.overline,
          ),
        ),
      );
    }

    // 插入描述文字
    if (desc.isNotEmpty) {
      content.insert(
          1,
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(children: _content(context)));
}
