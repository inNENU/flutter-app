import 'dart:io';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:logging/logging.dart';
import 'package:path/path.dart' as path;

final _logger = Logger('file');

class FileManager {
  /// 删除文件或文件夹
  static void delete(String path) {
    try {
      Link(path).deleteSync(recursive: true);
    } catch (err) {
      // 调试
      _logger.shout('删除 $path 出错,错误为:', err);
    }
  }

  /// 判断对应文件或文件夹是否存在
  static bool exist(String path) => Link(path).existsSync();

  /// 列出文件夹下文件
  static List<FileSystemEntity> listFile(String path) {
    try {
      final fileList = Directory(path).listSync();

      _logger.info('$path 文件夹下文件为：', fileList); // 调试

      return fileList;
    } catch (err) {
      // 调试
      _logger.shout('列出 $path 文件夹下文件错误：', err); // 调试

      return [];
    }
  }

  // static void _unzip(
  //   String fileName, {
  //   String basePath,
  //   String unzipPath,
  // }) {
  //   /// 压缩文件路径
  //   final filePath = resolve(basePath, fileName);

  //   /// 解压文件夹路径
  //   final unzipFolderPath = resolve(basePath,
  //       unzipPath.isEmpty ? '${path.withoutExtension(fileName)}/' : unzipPath);

  //   // 读取 zip 文件
  //   final bytes = File(filePath).readAsBytesSync();

  //   // 解码 zip 文件
  //   final archive = ZipDecoder().decodeBytes(bytes);

  //   // 将 zip 解压到硬盘
  //   for (final file in archive) {
  //     final filename = file.name;
  //     if (file.isFile) {
  //       final data = file.content as List<int>;
  //       File(unzipFolderPath + filename)
  //         ..createSync(recursive: true)
  //         ..writeAsBytesSync(data);
  //     } else {
  //       Directory(unzipFolderPath + filename)..create(recursive: true);
  //     }
  //   }
  // }
}
