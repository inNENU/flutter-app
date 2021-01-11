import 'dart:io';

import 'package:flutter/foundation.dart';

// ignore: avoid_classes_with_only_static_members
class DeviceInfo {
  /// 设备信息
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => isAndroid || isIOS;
  static bool isWeb = kIsWeb;

  static bool isWindows = Platform.isWindows;
  static bool isLinux = Platform.isLinux;
  static bool isMacOS = Platform.isMacOS;
  static bool isAndroid = Platform.isAndroid;
  static bool isFuchsia = Platform.isFuchsia;
  static bool isIOS = Platform.isIOS;

  /// debug 开关，上线需要关闭
  ///
  /// App 运行在 Release 环境时，inProduction 为 true
  /// 当 App 运行在 Debug 和 Profile 环境时，inProduction 为 false
  static bool inProduction = kReleaseMode;

  static bool isDriverTest = false;
  static bool isUnitTest = false;
}
