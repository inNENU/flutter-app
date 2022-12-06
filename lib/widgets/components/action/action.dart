import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logging/logging.dart';
import 'package:url_launcher/url_launcher_string.dart';

part 'action.g.dart';

final _logger = Logger('component.action');

/// 组件
@JsonSerializable()
class ActionComponent extends StatelessWidget {
  const ActionComponent(
    this.content, {
    this.header = '',
    super.key,
  });

  factory ActionComponent.fromJson(Map<String, dynamic> json) =>
      _$ActionComponentFromJson(json);

  /// 动作标题
  final String header;

  /// 动作内容
  final String content;

  /// 是否是链接
  bool get isLink => content.startsWith(RegExp('https?://'));

  Future<void> openLink() => canLaunchUrlString(content).then((canLaunch) {
        if (canLaunch) {
          launchUrlString(content);
        } else {
          _logger.warning('Action: can not perform an action');
        }
      });

  Future<void> copyText() => Clipboard.setData(ClipboardData(text: content));

  Map<String, dynamic> toJson() => _$ActionComponentToJson(this);

  @override
  Widget build(BuildContext context) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(children: [
        if (isLink)
          ListTile(
            onTap: openLink,
            title: Text(content),
            // trailing:
            //     config.canTap ? const Icon(Icons.chevron_right) : null,
          )
        else
          ListTile(
            onTap: copyText,
            title: Text(content),
            trailing: const Icon(Icons.copy),
          )
      ]));
}
