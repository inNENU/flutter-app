import 'package:flutter/material.dart';

import '../../components/index.dart';
import 'config.dart';

/// 主页
NavigationBarConfig mainPageWidget = NavigationBarConfig(
  ListView(
    children: [
      MyTitle('测试项目'),
      MyList([
        MyListConfig('textTheme 测试', url: '/test/textTheme'),
        MyListConfig('head 测试', url: '/test/head'),
        MyListConfig('title 测试', url: '/test/title'),
        MyListConfig('paragraph 测试', url: '/test/paragraph'),
        MyListConfig('image 测试', url: '/test/image'),
        MyListConfig('list 测试', url: '/test/list'),
      ]),
      // MyGrid([MyGridConfig(text: 'aa')]),
    ],
  ),
  title: '主页',
  icon: Icon(Icons.home),
);
