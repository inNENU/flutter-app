import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:innenu/utils/tool.dart';
import 'package:logging/logging.dart';

final logger = Logger('JSONTools');

class IconWidget {
  const IconWidget(this.icon, {this.size = 30});

  /// 图标
  final String icon;

  // 尺寸
  final double size;

  /// 是否为在线资源
  bool get _isOnlineResourse =>
      icon.startsWith('https://') || icon.startsWith('http://');

  bool get _isImage =>
      icon.endsWith('.png') || icon.endsWith('.jpg') || icon.endsWith('jpeg');

  /// 是否是在线图片
  bool get isOnlineImage => _isOnlineResourse && _isImage;

  bool get isLocalImage => _isImage && icon.startsWith('assets/');

  /// 是否是在线 SVG
  bool get isOnlineSVG => _isOnlineResourse && icon.endsWith('.svg');

  /// 是否为合法本地资源
  bool get isLocalSvg => icon.startsWith('assets/') && icon.endsWith('.svg');

  /// 是否为合法本地资源
  bool get isIconString => RegExp(r'^([a-z]|[0-9]|-)+$').hasMatch(icon);

  /// 图片组件
  Widget? get iconWidget => isIconString
      // TODO(Mister-Hope): Support reading local svg
      ? SvgPicture.network('https://mp.innenu.com/res/icon/$icon.svg')
      : isLocalSvg
          ? SvgPicture.asset(icon)
          : isOnlineSVG
              ? SvgPicture.network(icon)
              : isOnlineImage
                  ? CachedNetworkImage(imageUrl: icon)
                  : isLocalImage
                      ? Image.asset(icon)
                      : null;

  /// 图标组件
  Widget? get widget => iconWidget == null
      ? null
      : SizedBox(
          width: size,
          height: size,
          child: iconWidget,
        );
}

class JSONTools {
  /// 获得对齐方式
  static TextAlign getAlign(String? align) =>
      Tool.string2EnumMap(TextAlign.values, defaultValue: TextAlign.justify)(
          align);

  /// 获取图标组件
  static Widget? getIconWidget(String icon, [double size = 30]) {
    final iconWidget = IconWidget(icon, size: size);

    return iconWidget.widget;
  }

  /// 卡片标题
  static Widget cardHead(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );

  /// 卡片脚注
  static Widget cardFoot(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 8),
        child: Text(
          text,
          style: Theme.of(context).textTheme.caption,
        ),
      );

  /// 加载组件
  static Widget loadingWidget([double margin = 35]) => Padding(
        padding: EdgeInsets.symmetric(vertical: margin),
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );

  /// 加载组件
  static Widget loadingProgressWidget(double downloadProgress,
          [double margin = 35]) =>
      Padding(
        padding: EdgeInsets.symmetric(vertical: margin),
        child: Center(
          child: CircularProgressIndicator(value: downloadProgress),
        ),
      );
}
