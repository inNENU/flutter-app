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
          MyListConfig('textTheme 测试', url: '/test/textTheme'),
          MyListConfig('head 测试', url: '/test/head'),
          MyListConfig('title 测试', url: '/test/title'),
          MyListConfig('paragraph 测试', url: '/test/paragraph'),
          MyListConfig('image 测试', url: '/test/image'),
          MyListConfig('list 测试', url: '/test/list'),
          MyListConfig('grid 测试', url: '/test/grid'),
          MyListConfig('phone 测试', url: '/test/phone'),
          MyListConfig('foot 测试', url: '/test/foot'),
          MyListConfig('MyPage 测试', aim: 'card0'),
        ],
        head: '类测试',
      ),
      MyList(
        [
          MyListConfig('head 测试', url: '/test/headJSON'),
          MyListConfig('title 测试', url: '/test/titleJSON'),
          MyListConfig('paragraph 测试', url: '/test/paragraphJSON'),
          MyListConfig('image 测试', url: '/test/imageJSON'),
          MyListConfig('list 测试', url: '/test/listJSON'),
          MyListConfig('grid 测试', url: '/test/gridJSON'),
          MyListConfig('foot 测试', url: '/test/footJSON'),
          MyListConfig('MyPage 测试', aim: 'card0'),
        ],
        head: 'JSON 测试',
      ),
    ],
  ),
  title: '功能',
  icon: Icon(Icons.apps),
);
