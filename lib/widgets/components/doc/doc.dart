import 'package:flutter/material.dart';
import 'package:innenu/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:innenu/utils/json_tools.dart';

part 'doc.g.dart';

String _getDocIcon(String url) {
  final docType = url.split('.').last;

  return docType == 'docx' || docType == 'doc'
      ? 'doc'
      : docType == 'pptx' || docType == 'ppt'
          ? 'ppt'
          : docType == 'xlsx' || docType == 'xls'
              ? 'xls'
              : docType == 'jpg' || docType == 'jpeg' || docType == 'jfif'
                  ? 'jpg'
                  : docType == 'mp4' ||
                          docType == 'mov' ||
                          docType == 'avi' ||
                          docType == 'rmvb'
                      ? 'video'
                      : docType == 'pdf'
                          ? 'pdf'
                          : docType == 'png' || docType == 'gif'
                              ? docType
                              : 'document';
}

/// 文档组件
@JsonSerializable()
class DocComponent extends StatelessWidget {
  DocComponent(
    this.name,
    this.url, {
    String icon = '',
    this.downloadable = true,
  }) : icon = icon ?? _getDocIcon(url);

  factory DocComponent.fromJson(Map<String, dynamic> json) =>
      _$DocComponentFromJson(json);

  /// 文档名称
  final String name;

  /// 文档图标
  final String icon;

  /// 文档地址
  final String url;

  /// 是否可下载
  @JsonKey(defaultValue: true)
  final bool downloadable;

  Map<String, dynamic> toJson() => _$DocComponentToJson(this);

  /// Icon 路径
  String get _icon => 'assets/components/doc/$icon.svg';

  /// 下载文档
  Future<void> _download(BuildContext context) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      UI.tip(context, content: '无法调用系统浏览器');
    }
  }

  @override
  Widget build(BuildContext context) => Card(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: ListTile(
        leading: JSONTools.getIconWidget(_icon),
        title: Text(name),
        trailing: downloadable
            ? IconButton(
                padding: const EdgeInsets.all(4),
                icon: const Icon(Icons.file_download),
                onPressed: () async {
                  await _download(context);
                },
              )
            : null,
      ));
}
