import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logging/logging.dart';

final log = Logger('JSONTools');

class IconWidget {
  /// 图标
  final String icon;

  // 尺寸
  final double size;

  const IconWidget(this.icon, {double size}) : size = size ?? 30;

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
  bool get isLocalSvg =>
      (icon.startsWith('/module/icon/') || icon.startsWith('/icon/tabPage/')) &&
      icon.endsWith('.svg');

  /// 本地资源路径
  String get localAssetPath => isLocalSvg
      ? icon
          .replaceFirst('/module/icon/', 'assets/icon/module/')
          .replaceFirst('/icon/tabPage/', 'assets/icon/tab/')
      : '';

  /// 图片组件
  Widget get iconWidget => isLocalSvg
      ? SvgPicture.asset(localAssetPath)
      : isOnlineSVG
          ? SvgPicture.network(icon)
          : isOnlineImage
              ? CachedNetworkImage(imageUrl: icon)
              : isLocalImage ? Image.asset(icon) : null;

  /// 图标组件
  Widget get widget => iconWidget == null
      ? null
      : SizedBox(
          width: size,
          height: size,
          child: iconWidget,
        );
}

class JSONTools {
  /// 获得对齐方式
  static TextAlign getAlign(String align) {
    if (align == null) return TextAlign.justify;

    switch (align) {
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'center':
        return TextAlign.center;
      case 'justify':
        return TextAlign.justify;

      /// 非法 Align 值
      default:
        log.warning('Align value illegal: $align');

        return TextAlign.justify;
    }
  }

  /// 获取图标组件
  static Widget getIconWidget(String icon, [double size]) {
    final iconWidget = IconWidget(icon ?? '', size: size);

    return iconWidget.widget;
  }

  /// 卡片标题
  static Widget cardHead(BuildContext context, String text) => Padding(
        padding: const EdgeInsets.only(top: 8, left: 30, right: 30),
        child: Text(
          text,
          style: Theme.of(context).textTheme.body2,
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
}
