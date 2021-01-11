import 'package:logging/logging.dart';

/// 初始化日志管理器
Logger initLogManager() {
  Logger.root.level = Level.INFO; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print('${record.level.name}: ${record.time}: ${record.message}');
  });

  return Logger.root;
}
