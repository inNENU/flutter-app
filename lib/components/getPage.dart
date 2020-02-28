import 'dart:convert';
// import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:logging/logging.dart';

import 'index.dart';

final _logger = Logger('component.page');

/// 获取文件夹名称
String _resolveFolderName(String aim) {
  var length = aim.length;

  while (length > 0) {
    try {
      int.parse(aim[length - 1]);
      length -= 1;
    } catch (error) {
      if (error is FormatException) break;
    }
  }

  // final aimName = aim.substring(0, length);
  // final aimNumber = aim.substring(length);

  return aim.substring(0, length);
}

/// 获得页面对象
Future<MyPage> getPage(String url) async {
  final response = await http.get(url, headers: {'Accept': 'application/json'});

  if (response.statusCode == 200) {
    final jsonString = const Utf8Decoder().convert(response.bodyBytes);
    final config = json.decode(jsonString) as List;

    // If server returns an OK response, parse the JSON.
    return MyPage.fromJson(config);
  }

  _logger.warning('Request failed with statusCode: ${response.statusCode}');

  return MyPage.fromJson(<Map<String, dynamic>>[
    <String, dynamic>{'tag': 'head', 'title': 'error'}
  ]);
}

/// 通过 aim 获得页面对象
Future<MyPage> getPageFromAim(String aim) async {
  /// 文件夹
  final folder = _resolveFolderName(aim);

  return await getPage('https://mp.innenu.com/page/$folder/$aim.json');
}
