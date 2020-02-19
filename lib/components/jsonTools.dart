import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

final log = Logger('JSONTools');

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
}
