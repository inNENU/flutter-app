import 'dart:io';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

import 'path.dart';

final _logger = Logger('file');

/// 删除文件或文件夹
void deleteFile(String path) {
  try {
    Link(path).deleteSync(recursive: true);
  } on Exception catch (err) {
    // 调试
    _logger.shout('删除 $path 出错,错误为:', err);
  }
}

/// 判断对应文件或文件夹是否存在
bool isPathExist(String path) => Link(path).existsSync();

/// 列出文件夹下文件
List<FileSystemEntity> listFile(String path) {
  try {
    final fileList = Directory(path).listSync();

    _logger.info('$path 文件夹下文件为：', fileList); // 调试

    return fileList;
  } on Exception catch (err) {
    // 调试
    _logger.shout('列出 $path 文件夹下文件错误：', err); // 调试

    return [];
  }
}

/// 解压文件
Future<void> unzipFile(
  String filePath, {
  BaseFolder base = BaseFolder.temp,
  String unzipPath = '',
  BaseFolder unzipBase = BaseFolder.appFile,
}) async {
  /// 压缩文件路径
  final zipFilePath = await Path.resolveBase(
      base, filePath.endsWith('zip') ? filePath : '$filePath.zip');

  /// 解压文件夹路径
  final unzipFolderPath = await Path.resolveBase(
      unzipBase,
      unzipPath.isEmpty
          ? '${path.withoutExtension(filePath)}/'
          : unzipPath.endsWith('/')
              ? unzipPath
              : '$unzipPath/');

  // 读取 zip 文件
  final bytes = File(zipFilePath).readAsBytesSync();

  // 解码 zip 文件
  final archive = ZipDecoder().decodeBytes(bytes);

  // 将 zip 解压到硬盘
  for (final file in archive) {
    final filename = file.name;
    if (file.isFile) {
      final data = file.content as List<int>;
      File(unzipFolderPath + filename)
        ..createSync(recursive: true)
        ..writeAsBytesSync(data);
    } else {
      await Directory(unzipFolderPath + filename).create(recursive: true);
    }
  }
}
