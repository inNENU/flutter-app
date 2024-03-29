import 'dart:convert' as convert;
import 'package:common_utils/common_utils.dart';

import 'info.dart';

/// 日志标签
const String tag = 'in-NENU';

void init() {
  LogUtil.init(isDebug: !DeviceInfo.inProduction);
}

void d(String msg, {String tag = tag}) {
  if (!DeviceInfo.inProduction) {
    LogUtil.v(msg, tag: tag);
  }
}

void e(String msg, {String tag = tag}) {
  if (!DeviceInfo.inProduction) {
    LogUtil.e(msg, tag: tag);
  }
}

void json(String msg, {String tag = tag}) {
  if (!DeviceInfo.inProduction) {
    try {
      final dynamic data = convert.json.decode(msg);
      if (data is Map) {
        _printMap(data);
      } else if (data is List) {
        _printList(data);
      } else {
        LogUtil.v(msg, tag: tag);
      }
    } on Exception catch (e) {
      LogUtil.e('$msg: $e', tag: tag);
    }
  }
}

// https://github.com/Milad-Akarie/pretty_dio_logger
void _printMap(Map data,
    {String tag = tag,
    int tabs = 1,
    bool isListItem = false,
    bool isLast = false}) {
  int tabNumber = tabs;
  final isRoot = tabNumber == 1;
  final initialIndent = _indent(tabNumber);
  tabNumber += 1;

  if (isRoot || isListItem) {
    LogUtil.v('$initialIndent{', tag: tag);
  }

  data.keys.toList().asMap().forEach((index, dynamic key) {
    final isLast = index == data.length - 1;
    dynamic value = data[key];
    if (value is String) {
      value = '"$value"';
    } else if (value is Map) {
      if (value.isEmpty) {
        LogUtil.v('${_indent(tabNumber)} $key: $value${!isLast ? ',' : ''}',
            tag: tag);
      } else {
        LogUtil.v('${_indent(tabNumber)} $key: {', tag: tag);
        _printMap(value, tabs: tabNumber);
      }
    } else if (value is List) {
      if (value.isEmpty) {
        LogUtil.v('${_indent(tabNumber)} $key: ${value.toString()}', tag: tag);
      } else {
        LogUtil.v('${_indent(tabNumber)} $key: [', tag: tag);
        _printList(value, tabs: tabNumber);
        LogUtil.v('${_indent(tabNumber)} ]${isLast ? '' : ','}', tag: tag);
      }
    } else {
      final msg = value.toString().replaceAll('\n', '');
      LogUtil.v('${_indent(tabNumber)} $key: $msg${!isLast ? ',' : ''}',
          tag: tag);
    }
  });

  LogUtil.v('$initialIndent}${isListItem && !isLast ? ',' : ''}', tag: tag);
}

void _printList(List list, {String tag = tag, int tabs = 1}) {
  list.asMap().forEach((i, dynamic e) {
    final isLast = i == list.length - 1;
    if (e is Map) {
      if (e.isEmpty) {
        LogUtil.v('${_indent(tabs)}  $e${!isLast ? ',' : ''}', tag: tag);
      } else {
        _printMap(e, tabs: tabs + 1, isListItem: true, isLast: isLast);
      }
    } else {
      LogUtil.v('${_indent(tabs + 2)} $e${isLast ? '' : ','}', tag: tag);
    }
  });
}

String _indent([int tabCount = 1]) => '  ' * tabCount;
