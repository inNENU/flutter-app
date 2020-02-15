import 'dart:convert';
// import 'dart:io';
import 'package:http/http.dart' as http;

Future<PageData> getPageData(String aim) async {
  final response = await http.get(
    'https://mp.innenu.com/page/',
  );
  final responseJson = json.decode(response.body);

  return PageData.fromJson(responseJson);
}

class PageData {
  /// 页面数据
  List<dynamic> pagedata;

  PageData(this.pagedata);

  factory PageData.fromJson(List<dynamic> json) {
    return PageData(json);
  }
}
