import 'dart:convert';
// import 'dart:io';
import 'package:http/http.dart' as http;

Future<PageData> getPageData(String aim) async {
  final response = await http.get(
    'https://mp.innenu.com/page/',
  );

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    return PageData.fromJson(json.decode(response.body) as List<dynamic>);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

class PageData {
  /// 页面数据
  List<dynamic> pagedata;

  PageData(this.pagedata);

  factory PageData.fromJson(List<dynamic> json) {
    return PageData(json);
  }
}
