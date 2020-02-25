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
        MyListConfig('grid 测试', url: '/test/grid'),
        MyListConfig('foot 测试', url: '/test/foot'),
      ]),
      // MyGrid([
      //   MyGridConfig(text: '列表项1'),
      //   MyGridConfig(text: '列表项2'),
      //   MyGridConfig(text: '列表项3'),
      //   MyGridConfig(text: '列表项4'),
      // ]),
    ],
  ),
  title: '主页',
  icon: Icon(Icons.home),
);
