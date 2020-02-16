import 'package:flutter/material.dart';

class JSONTools {
  /// 获得对齐方式
  static TextAlign getAlign(String align) {
    switch (align) {
      case 'left':
        return TextAlign.left;
      case 'right':
        return TextAlign.right;
      case 'center':
        return TextAlign.center;
      case 'justify':
        return TextAlign.justify;
    }

    /// 非法 Align 值
    throw ErrorDescription('Align value illegal: $align');
  }
}
