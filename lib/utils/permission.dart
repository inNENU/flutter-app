import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

import 'ui/material.dart';

final _logger = Logger('permission');

final List<String> _permissionNames = [
  'calendar',
  'camera',
  'contacts',
  'location',
  'locationAlways',
  'locationWhenInUse',
  'mediaLibrary',
  'microphone',
  'phone',
  'photos',
  'photosAddOnly',
  'reminders',
  'sensors',
  'sms',
  'speech',
  'storage',
  'ignoreBatteryOptimizations',
  'notification',
  'accessMediaLocation',
  'activityRecognition',
  'unknown',
  'bluetooth',
  'manageExternalStorage',
  'systemAlertWindow',
  'requestInstallPackages',
  'appTrackingTransparency',
  'criticalAlerts',
  'accessNotificationPolicy',
];

Permission permissionFromString(String permissionString) {
  switch (permissionString) {
    case 'calendar':
      return Permission.calendarWriteOnly;
    case 'calendar-full':
      return Permission.calendarFullAccess;
    case 'camera':
      return Permission.camera;
    case 'contact':
      return Permission.contacts;
    case 'mediaLibrary': // only iOS
      return Permission.mediaLibrary;
    case 'microphone':
      return Permission.microphone;
    case 'phone': // only Android
      return Permission.phone;
    case 'photo': // only iOS
      return Permission.photos;
    case 'reminder': // only iOS
      return Permission.reminders;
    case 'sensor':
      return Permission.sensors;
    case 'sms': // only Android
      return Permission.sms;
    case 'speech':
      return Permission.speech;
    case 'storage':
      return Permission.storage;
    case 'batteryOptimize': // only Android
      return Permission.ignoreBatteryOptimizations;
    case 'mediaLocation': // only Android
      return Permission.accessMediaLocation;
    case 'activityRecognition': // only Android Q+
      return Permission.activityRecognition;
    case 'notification':
      return Permission.notification;
    case 'location':
      return Permission.location;
    case 'locationAlways':
      return Permission.locationAlways;
    case 'locationWhenInUse':
      return Permission.locationWhenInUse;

    default:
      _logger.warning('Unknown permission string $permissionString.');
      return Permission.unknown;
  }
}

String permissionToString(Permission permission) =>
    _permissionNames[permission.value];

List<String> _permissionLocaleStrings = [
  '日历',
  '相机',
  '联系人',
  '位置',
  'locationAlways',
  'locationWhenInUse',
  '媒体库',
  '麦克风',
  'phone',
  '相册',
  'photosAddOnly',
  '备忘录',
  '传感器',
  '短信',
  '实时音视频',
  '存储空间',
  'ignoreBatteryOptimizations',
  '通知',
  'accessMediaLocation',
  'activityRecognition',
  'unknown',
  'bluetooth',
  'manageExternalStorage',
  'systemAlertWindow',
  'requestInstallPackages',
  'appTrackingTransparency',
  'criticalAlerts',
  'accessNotificationPolicy',
];

String permissionToLocaleString(Permission permission) =>
    _permissionLocaleStrings[permission.value];

/// 检查权限状态
Future<PermissionStatus> checkPermission(String permissionString) =>
    permissionFromString(permissionString).status;

/// 请求权限
Future<PermissionStatus> requestPermission(String permissionString) {
  final permission = permissionFromString(permissionString);

  return permission.request();
}

/// 同时请求多个权限
Future<Map<String, PermissionStatus>> requestPermissions(
    List<String> permissionStringList) {
  final permissionList =
      permissionStringList.map(permissionFromString).toList();

  return permissionList.request().then((result) => result.map(
      (permission, status) =>
          MapEntry(permissionToString(permission), status)));
}

/// 检查并获取权限
Future<bool> checkAndAskPermission(
    BuildContext context, String permissionString) {
  final permission = permissionFromString(permissionString);
  final localeString = permissionToLocaleString(permission);

  return checkPermission(permissionString).then((status) {
    switch (status) {
      case PermissionStatus.permanentlyDenied: // 用户选择不再询问
        showTip(
          context,
          content: '您已永久拒绝 $localeString 权限。',
          actionLabel: '打开',
          action: openAppSettings,
        );
        return false;

      case PermissionStatus.denied: // 用户已拒绝
        // 请求权限
        Future<bool> request() =>
            requestPermission(permissionString).then((status) {
              if (status == PermissionStatus.granted) {
                return true;
              } else {
                showTip(
                  context,
                  content: '您拒绝了 $localeString 权限请求',
                  actionLabel: '重试',
                  action: request,
                );

                return false;
              }
            });
        return request();

      case PermissionStatus.restricted: // 获得权限受限
        showTip(
          context,
          content: '受到访问限制，无法获得$localeString',
          actionLabel: '详情',
          action: () {
            final tip = Platform.isIOS
                ? '访问限制配置'
                : Platform.isAndroid
                    ? '数字健康/学生模式/设备使用监控'
                    : '您的监护人/设备管控系统'
                        '';

            showModal<void>(context,
                title: '收到系统限制',
                content: '$tip 禁止您的应用获取 $localeString 权限',
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('确定'),
                  )
                ]);
          },
        );
        return false;

      case PermissionStatus.provisional: // 用户选择不再询问
        showTip(
          context,
          content: '您已永久拒绝 $localeString 权限。',
          actionLabel: '打开',
          action: openAppSettings,
        );
        return false;

      case PermissionStatus.limited: // 已获得受限权限
      case PermissionStatus.granted: // 已获得权限
        return true;
    }
  });
}
