import 'dart:io';
// import 'package:archive/archive.dart';
// import 'package:archive/archive_io.dart';
import 'package:path_provider/path_provider.dart';
import 'package:logging/logging.dart';

final _logger = Logger('file');

class FileManager {
  /// 缓存目录
  static Future<Directory> get tempDir async => await getTemporaryDirectory();

  /// 缓存目录路径
  static Future<String> get tempPath async {
    final tempDir = await getTemporaryDirectory();

    return tempDir.path;
  }

  /// 用户目录
  static Future<Directory> get userDir async =>
      await getApplicationDocumentsDirectory();

  /// 用户目录路径
  static Future<String> get userPath async {
    final userDir = await getApplicationDocumentsDirectory();

    return userDir.path;
  }

  /// 程序目录
  static Future<Directory> get appDir async =>
      await getApplicationDocumentsDirectory();

  /// 程序目录路径
  static Future<String> get appPath async {
    final appDir = await getApplicationDocumentsDirectory();

    return appDir.path;
  }

  /// 删除文件或文件夹
  static void $delete(String path, [bool isDir]) {
    if (isDir == null) {
      try {
        // 判断路径是否是文件，并执行对应删除操作
        if (FileSystemEntity.isFileSync(path)) {
          File(path).deleteSync();
        } else {
          Directory(path).deleteSync(recursive: true);
        }
      } catch (err) {
        // 调试
        _logger.shout('删除 $path 出错,错误为:', err);
      }
      // 是目录
    } else if (isDir) {
      try {
        Directory(path).deleteSync(recursive: true);
      } catch (err) {
        // 调试
        _logger.shout('删除 $path 出错,错误为:', err);
      }
    }
    // 是文件
    else {
      try {
        File(path).deleteSync();
      } catch (err) {
        // 调试
        _logger.shout('删除 $path 出错,错误为:', err);
      }
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

  // void main() {
  //   // Read the Zip file from disk.
  //   final bytes = File('test.zip').readAsBytesSync();

  //   // Decode the Zip file
  //   final archive = ZipDecoder().decodeBytes(bytes);

  //   // Extract the contents of the Zip archive to disk.
  //   for (final file in archive) {
  //     final filename = file.name;
  //     if (file.isFile) {
  //       final data = file.content as List<int>;
  //       File('out/' + filename)
  //         ..createSync(recursive: true)
  //         ..writeAsBytesSync(data);
  //     } else {
  //       Directory('out/' + filename)..create(recursive: true);
  //     }
  //   }
  // }
}
