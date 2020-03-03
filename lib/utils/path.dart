import 'dart:io';
// import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import 'tool.dart';

// final _logger = Logger('lib.path');

/// 缓存目录
///
/// 该目录可能随时被清除
Directory _tempDir;

/// 应用文件目录
///
/// 用于存储应用需要读取、但不希望暴露给用户的文件
Directory _appFileDir;

/// 应用数据目录
///
/// 用于存储应用的用户数据文件
Directory _appDataDir;

/// 外部存储目录
///
/// 仅 Android 可用
Directory _extDir;

/// App Library 目录
///
/// 仅 iOS 可用
/// 用于存储数据库等包含用户隐私信息的敏感文件
Directory _libDir;

/// 预定义的外部存储项目目录
///
/// 仅 Android 可用
Map<String, Directory> _extSystemDir;

/// 基文件夹
enum BaseFolder {
  appData,
  appFile,
  extStorage,
  picture,
  document,
}

class Path {
  /// 处理路径
  static String Function(
    String, [
    String,
    String,
    String,
    String,
    String,
    String,
    String,
  ]) resolve = path.join;

  /// 缓存目录
  static Future<Directory> get tempDir async =>
      _tempDir ??= await getTemporaryDirectory();

  /// 缓存目录路径
  static Future<String> get tempPath => tempDir.then((tempDir) => tempDir.path);

  /// APP 文件目录
  static Future<Directory> get appFileDir async =>
      _appFileDir ??= await getApplicationSupportDirectory();

  /// APP 文件路径
  static Future<String> get appFilePath =>
      appFileDir.then((appFileDir) => appFileDir.path);

  /// 用户数据目录
  static Future<Directory> get appDataDir async =>
      _appDataDir ??= await getApplicationDocumentsDirectory();

  /// 用户数据路径
  static Future<String> get appDataPath =>
      appDataDir.then((appDataDir) => appDataDir.path);

  /// 外部存储目录，仅 Android
  static Future<Directory> get extDir async =>
      _extDir ??= await getExternalStorageDirectory();

  /// 外部存储路径，仅 Android
  static Future<String> get extPath => extDir.then((extDir) => extDir.path);

  static final _storageDirMap =
      Tool.string2EnumMap<StorageDirectory>(StorageDirectory.values);

  /// 预定义的外部存储目录，仅 Android
  static Future<Directory> extSystemDir(String dirName) async {
    _extSystemDir[dirName] ??=
        (await getExternalStorageDirectories(type: _storageDirMap(dirName)))[0];

    return _extSystemDir[dirName];
  }

  /// 预定义的外部存储目录，仅 Android
  static Future<String> extSystemPath(String dirName) =>
      extSystemDir(dirName).then((extSystemDir) => extSystemDir.path);

  /// 应用库目录，仅 iOS
  static Future<Directory> get libDir async =>
      _libDir ??= await getLibraryDirectory();

  /// 应用库路径，仅 iOS
  static Future<String> get libPath => libDir.then((libDir) => libDir.path);

  /// 路径处理
  static Future<String> resolveBase({
    String path,
    BaseFolder base,
  }) async {
    switch (base) {
      case BaseFolder.appData:
        return resolve(await appDataPath, path);

      case BaseFolder.extStorage:
        return resolve(await extPath, path);

      case BaseFolder.document:
        return resolve(await extSystemPath('documents'), path);

      case BaseFolder.picture:
        return resolve(await extSystemPath('pictures'), path);

      case BaseFolder.appFile:
      default:
        return resolve(await appFilePath, path);
    }
  }
}
