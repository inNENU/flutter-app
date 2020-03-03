import 'package:flutter/material.dart';

import '../../components/index.dart';
import 'config.dart';

/// 功能页
NavigationBarConfig functionPageWidget = NavigationBarConfig(
  ListView(
    children: [
      MyList(
        [
          MyListConfig('textTheme', url: '/test/textTheme'),
        ],
        head: '展示项目',
      ),
      MyList(
        [
          MyListConfig('组件测试', url: '/test/component'),
          MyListConfig('Path 库测试', url: '/test/utils/path'),
        ],
        head: '测试列表',
      ),
    ],
  ),
  title: '功能',
  icon: Icon(Icons.apps),
);
