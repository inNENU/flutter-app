import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

import 'ui/material.dart';

final _logger = Logger('permission');

class MyPermission {
  static Permission permissionFromString(String permissionString) {
    switch (permissionString) {
      case 'calendar':
        return Permission.calendar;
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
      // case 'location':
      //   return Permission.location;
      // case 'locationAlways':
      //   return Permission.locationAlways;
      // case 'locationWhenInUse':
      //   return Permission.locationWhenInUse;

      default:
        _logger.warning('Unknown permision string $permissionString.');
        return Permission.unknown;
    }
  }

  static String permissionToString(Permission permission) {
    switch (permission) {
      case Permission.calendar:
        return 'calendar';
      case Permission.camera:
        return 'camera';
      case Permission.contacts:
        return 'contact';
      case Permission.microphone:
        return 'microphone';
      case Permission.photos:
        return 'photo';
      case Permission.reminders: // only iOS
        return 'reminder';
      case Permission.sensors:
        return 'sensor';
      case Permission.sms: // only Android
        return 'sms';
      case Permission.storage: // only Android
        return 'storage';
      case Permission.speech:
        return 'speech';
      case Permission.mediaLibrary: // only iOS
        return 'mediaLibrary';
      case Permission.notification: // only iOS
        return 'notification';
      // case Permission.phone:
      // return 'phone'; // only iOS
      // case Permission.location:
      //   return 'location';
      // case Permission.locationAlways:
      //   return 'locationAlways';
      // case Permission.locationWhenInUse:
      //   return 'locationWhenInUse';

      default:
        _logger.warning('Unknown permision string $permission.');
        return 'unknown';
    }
  }

  static String permissionToLocaleString(Permission permission) {
    switch (permission) {
      case Permission.calendar:
        return '日历';
      case Permission.camera:
        return '相机';
      case Permission.contacts:
        return '联系人';
      case Permission.microphone:
        return '麦克风';
      case Permission.photos:
        return '相册';
      case Permission.reminders: // only iOS
        return '备忘录';
      case Permission.sensors:
        return '传感器';
      case Permission.sms: // only Android
        return '信息';
      case Permission.storage: // only Android
        return '存储空间';
      case Permission.speech:
        return '实时音视频';
      case Permission.mediaLibrary: // only iOS
        return '媒体库';
      case Permission.notification: // only iOS
        return '通知';
      // case Permission.phone:
      //   return '电话'; // only iOS
      // case Permission.location:
      //   return '位置';
      // case Permission.locationAlways:
      //   return '位置(总是)';
      // case Permission.locationWhenInUse:
      //   return '位置(使用时)';

      default:
        _logger.warning('Unknown permision string $permission.');
        return '未知权限';
    }
  }

  /// 检查权限状态
  static Future<PermissionStatus> checkPermission(String permissionString) =>
      permissionFromString(permissionString).status;

  /// 请求权限
  static Future<PermissionStatus> requestPermission(String permissionString) {
    final permisstion = permissionFromString(permissionString);

    return permisstion.request();
  }

  /// 同时请求多个权限
  static Future<Map<String, PermissionStatus>> requestPermissions(
      List<String> permissionStringList) {
    final permissionList =
        permissionStringList.map(permissionFromString).toList();

    return permissionList.request().then((result) => result.map(
        (permission, status) =>
            MapEntry(permissionToString(permission), status)));
  }

  /// 检查并获取权限
  static Future<bool> checkAndAskPermission(
      BuildContext context, String permissionString) {
    final permission = permissionFromString(permissionString);
    final localeString = permissionToLocaleString(permission);

    return checkPermission(permissionString).then((status) {
      switch (status) {
        case PermissionStatus.permanentlyDenied: // 用户选择不再询问
          UI.tip(
            context,
            content: '您已永久拒绝 $localeString 权限。',
            actionLabel: '打开',
            action: openAppSettings,
          );
          return false;

        case PermissionStatus.undetermined: // 未请求过权限
        case PermissionStatus.denied: // 用户已拒绝
          // 请求权限
          Future<bool> request() =>
              requestPermission(permissionString).then((status) {
                if (status == PermissionStatus.granted) {
                  return true;
                } else {
                  UI.tip(
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
          UI.tip(
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

              UI.modal<void>(context,
                  title: '收到系统限制',
                  content: '$tip 禁止您的应用获取 $localeString 权限',
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('确定'),
                    )
                  ]);
            },
          );
          return false;

        case PermissionStatus.granted: // 已获得权限
          return true;
      }

      _logger.warning('Unknown Status $status');
      return false;
    });
  }
}
