import 'dart:io';

import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:permission_handler/permission_handler.dart';

import 'tool.dart';

final _logger = Logger('permission');

class MyPermission {
  static PermissionGroup permissionFromString(String permissionString) {
    switch (permissionString) {
      case 'calendar':
        return PermissionGroup.calendar;
      case 'camera':
        return PermissionGroup.camera;
      case 'contact':
        return PermissionGroup.contacts;
      case 'location':
        return PermissionGroup.location;
      case 'microphone':
        return PermissionGroup.microphone;
      case 'phone': // only Android
        return PermissionGroup.phone;
      case 'photo': // only iOS
        return PermissionGroup.photos;
      case 'reminder': // only iOS
        return PermissionGroup.reminders;
      case 'sensor':
        return PermissionGroup.sensors;
      case 'sms': // only Android
        return PermissionGroup.sms;
      case 'storage': // only Android
        return PermissionGroup.storage;
      case 'speech':
        return PermissionGroup.speech;
      case 'locationAlways':
        return PermissionGroup.locationAlways;
      case 'locationWhenInUse':
        return PermissionGroup.locationWhenInUse;
      case 'mediaLibrary': // only iOS
        return PermissionGroup.mediaLibrary;
      case 'notification': // only iOS
        return PermissionGroup.notification;

      default:
        _logger.warning('Unknown permision string $permissionString.');
        return PermissionGroup.unknown;
    }
  }

  static String permissionToString(PermissionGroup permission) {
    switch (permission) {
      case PermissionGroup.calendar:
        return 'calendar';
      case PermissionGroup.camera:
        return 'camera';
      case PermissionGroup.contacts:
        return 'contact';
      case PermissionGroup.location:
        return 'location';
      case PermissionGroup.microphone:
        return 'microphone';
      case PermissionGroup.phone:
        return 'phone'; // only iOS
      case PermissionGroup.photos:
        return 'photo';
      case PermissionGroup.reminders: // only iOS
        return 'reminder';
      case PermissionGroup.sensors:
        return 'sensor';
      case PermissionGroup.sms: // only Android
        return 'sms';
      case PermissionGroup.storage: // only Android
        return 'storage';
      case PermissionGroup.speech:
        return 'speech';
      case PermissionGroup.locationAlways:
        return 'locationAlways';
      case PermissionGroup.locationWhenInUse:
        return 'locationWhenInUse';
      case PermissionGroup.mediaLibrary: // only iOS
        return 'mediaLibrary';
      case PermissionGroup.notification: // only iOS
        return 'notification';

      default:
        _logger.warning('Unknown permision string $permission.');
        return 'unknown';
    }
  }

  static String permissionToLocaleString(PermissionGroup permission) {
    switch (permission) {
      case PermissionGroup.calendar:
        return '日历';
      case PermissionGroup.camera:
        return '相机';
      case PermissionGroup.contacts:
        return '联系人';
      case PermissionGroup.location:
        return '位置';
      case PermissionGroup.microphone:
        return '麦克风';
      case PermissionGroup.phone:
        return '电话'; // only iOS
      case PermissionGroup.photos:
        return '相册';
      case PermissionGroup.reminders: // only iOS
        return '备忘录';
      case PermissionGroup.sensors:
        return '传感器';
      case PermissionGroup.sms: // only Android
        return '信息';
      case PermissionGroup.storage: // only Android
        return '存储空间';
      case PermissionGroup.speech:
        return '实时音视频';
      case PermissionGroup.locationAlways:
        return '位置(总是)';
      case PermissionGroup.locationWhenInUse:
        return '位置(使用时)';
      case PermissionGroup.mediaLibrary: // only iOS
        return '媒体库';
      case PermissionGroup.notification: // only iOS
        return '通知';

      default:
        _logger.warning('Unknown permision string $permission.');
        return '未知权限';
    }
  }

  /// 检查权限状态
  static Future<PermissionStatus> checkPermission(String permissionString) =>
      PermissionHandler()
          .checkPermissionStatus(permissionFromString(permissionString));

  /// 请求权限
  static Future<PermissionStatus> requestPermission(String permissionString) {
    final permisstion = permissionFromString(permissionString);

    return PermissionHandler().requestPermissions([permisstion]).then(
        (result) => result[permisstion]);
  }

  /// 同时请求多个权限
  static Future<Map<String, PermissionStatus>> requestPermissions(
      List<String> permissionStringList) {
    final permissionList =
        permissionStringList.map(permissionFromString).toList();

    return PermissionHandler()
        .requestPermissions(permissionList)
        .then((result) {
      return result.map((permission, status) =>
          MapEntry(permissionToString(permission), status));
    });
  }

  /// 检查并获取权限
  static Future<bool> checkAndAskPermission(
      BuildContext context, String permissionString) {
    final permission = permissionFromString(permissionString);
    final localeString = permissionToLocaleString(permission);

    return checkPermission(permissionString).then((status) {
      switch (status) {
        case PermissionStatus.neverAskAgain: // 用户选择不再询问
          Tool.tip(
            context,
            content: '您已永久拒绝 $localeString 权限。',
            actionLabel: '打开',
            action: () {
              PermissionHandler().openAppSettings();
            },
          );
          return false;

        case PermissionStatus.denied: // 用户已拒绝
        case PermissionStatus.disabled: // 用户未允许
          // 请求权限
          Future<bool> request() {
            return requestPermission(permissionString).then((status) {
              if (status == PermissionStatus.granted) {
                return true;
              } else {
                Tool.tip(
                  context,
                  content: '您拒绝了 $localeString 权限请求',
                  actionLabel: '重试',
                  action: request,
                );

                return false;
              }
            });
          }
          return request();

        case PermissionStatus.restricted: // 获得权限受限
          Tool.tip(
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

              Tool.modal<void>(context,
                  title: '收到系统限制',
                  content: '$tip 禁止您的应用获取 $localeString 权限',
                  actions: [
                    FlatButton(
                      child: const Text('确定'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ]);
            },
          );
          return false;

        case PermissionStatus.granted: // 已获得权限
          return true;

        default:
          _logger.warning('Unknown Statis $status');
          return false;
      }
    });
  }
}
