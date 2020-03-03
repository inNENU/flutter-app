import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:innenu/components/index.dart';
import 'package:innenu/utils/path.dart';

class _PathTestState extends State<PathTest> {
  var tempPath = '';
  var appDataPath = '';
  var appFilePath = '';
  var extPath = '';
  var downloadPath = '';

  @override
  void initState() {
    super.initState();
    Path.tempPath.then((tempPath) {
      setState(() {
        this.tempPath = tempPath;
      });
    });
    Path.appDataPath.then((appDataPath) {
      setState(() {
        this.appDataPath = appDataPath;
      });
    });
    Path.appFilePath.then((appFilePath) {
      setState(() {
        this.appFilePath = appFilePath;
      });
    });
    Path.extPath.then((extPath) {
      setState(() {
        this.extPath = extPath;
      });
    });

    getExternalStorageDirectories(type: StorageDirectory.downloads)
        .then((downloadPath) {
      this.downloadPath = downloadPath[0].path;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('File 相关测试'),
      ),
      body: ListView(
        children: [
          MyTitle('应用文件目录'),
          MyParagraph(appFilePath),
          MyTitle('应用数据目录'),
          MyParagraph(appDataPath),
          MyTitle('缓存目录'),
          MyParagraph(tempPath),
          MyTitle('外部存储目录'),
          MyParagraph(extPath),
          MyTitle('下载目录'),
          MyParagraph(downloadPath),
        ],
      ));
}

class PathTest extends StatefulWidget {
  PathTest({Key key}) : super(key: key);

  @override
  _PathTestState createState() => _PathTestState();
}
