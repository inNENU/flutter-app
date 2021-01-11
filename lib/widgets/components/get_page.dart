import 'dart:convert';
// import 'dart:io';
import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import 'components.dart';

final _logger = Logger('component.page');

/// 获得页面对象
Future<MyPage> getPage(String url) async {
  final response = await Dio().get<String>(url);

  if (response.statusCode == 200) {
    final config = json.decode(response.data) as Map<String, dynamic>;
    return MyPage.fromJson(config);
  }

  _logger.warning('Request failed with statusCode: ${response.statusCode}');

  return MyPage.fromJson(const <String, dynamic>{
    'title': '加载错误',
    'content': <void>[],
  });
}

/// 通过 ID 获得页面对象
Future<MyPage> getPageFromId(String id) async =>
    getPage('https://mp.innenu.com/resource/$id.json');
