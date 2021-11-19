import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher.dart' as launcher;

part 'action.g.dart';

final _logger = Logger('component.action');

/// 组件
@JsonSerializable()
class ActionComponent extends StatelessWidget {
  const ActionComponent(
    this.text, {
    this.header = '',
  });

  factory ActionComponent.fromJson(Map<String, dynamic> json) =>
      _$ActionComponentFromJson(json);

  /// 动作标题
  final String header;

  /// 动作内容
  final String text;

  /// 是否是链接
  bool get isLink => text.startsWith(RegExp('https?://'));

  Future<void> openLink() => launcher.canLaunch(text).then((canLaunch) {
        if (canLaunch) {
          launcher.launch(text);
        } else {
          _logger.warning('Phone: can not make phone call');
        }
      });

  Future<void> copyText() => Clipboard.setData(ClipboardData(text: text));

  Map<String, dynamic> toJson() => _$ActionComponentToJson(this);

  @override
  Widget build(BuildContext context) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(children: [
        if (isLink)
          ListTile(
            onTap: openLink,
            title: Text(text),
            // trailing:
            //     config.isTapable ? const Icon(Icons.chevron_right) : null,
          )
        else
          ListTile(
            onTap: copyText,
            title: Text(text),
            trailing: const Icon(Icons.copy),
          )
      ]));
}
