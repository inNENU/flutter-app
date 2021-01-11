import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:innenu/widgets/components/components.dart';
import 'package:innenu/utils/path.dart';

class _PathTestState extends State<PathTest> {
  String tempPath = '';
  String appDataPath = '';
  String appFilePath = '';
  String extPath = '';
  String downloadPath = '';

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

    extPath = extPath;

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
          const TitleComponent('应用文件目录'),
          TextComponent(appFilePath),
          const TitleComponent('应用数据目录'),
          TextComponent(appDataPath),
          const TitleComponent('缓存目录'),
          TextComponent(tempPath),
          const TitleComponent('外部存储目录'),
          TextComponent(extPath),
          const TitleComponent('下载目录'),
          TextComponent(downloadPath),
        ],
      ));
}

class PathTest extends StatefulWidget {
  const PathTest({Key key}) : super(key: key);

  @override
  _PathTestState createState() => _PathTestState();
}
