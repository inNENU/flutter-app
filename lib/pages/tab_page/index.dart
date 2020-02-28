import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:innenu/components/getPage.dart';
import 'package:logging/logging.dart';

import 'config.dart';
import 'drawer.dart';
import 'function.dart';
import 'guide.dart';
import 'main.dart';

export 'config.dart';

final _logger = Logger('tagPage');

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  /// 当前显示的页面索引
  int _selectedIndex = 0;

  /// Tab Bar 配置
  final List<NavigationBarConfig> _tabBarConfig = [
    mainPageWidget,
    functionPageWidget,
    guidePageWidget,
  ];

  /// 当前显示的页面名称
  String _pageName = 'main';

  /// 获取显示页面
  String get pageName => _pageName;

  /// 设置显示页面
  set pageName(String pageName) {
    setState(() {
      _selectedIndex = getIndexFromPageName(pageName);
      _pageName = pageName;
    });
  }

  void updatePage(String base, String pageName) {
    getPage('$base/$pageName.json').then((page) {
      setState(() {
        _tabBarConfig[getIndexFromPageName(pageName)].update(page);
      });
    });
  }

  /// 通过页面名称获取索引
  int getIndexFromPageName(String pageName) {
    switch (pageName) {
      case 'main':
        return 0;
      case 'function':
        return 1;
      case 'guide':
        return 2;
      default:
        _logger.warning('Illegal pageName: $pageName');
        return 0;
    }
  }

  /// 通过页面名称获取索引
  String getPageNameFromIndex(int index) {
    switch (index) {
      case 0:
        return 'main';
      case 1:
        return 'function';
      case 2:
        return 'guide';
      default:
        _logger.warning('Illegal index: $index, index should only be 0,1,2.');
        return 'main';
    }
  }

  @override
  void initState() {
    super.initState();
    final base = 'https://mp.innenu.com/config/wx33acb831ee1831a5';

    // 获取最新版本号
    http.get('$base/version.json').then((response) {
      if (response.statusCode == 200) {
        final version = jsonDecode(response.body) as String;
        final url = '$base/$version';

        updatePage(url, 'main');
        updatePage(url, 'guide');
      } else {
        _logger.shout('Get version fail');
      }
    });
  }

  /// 切换页面
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageName = getPageNameFromIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _tabBarConfig.elementAt(_selectedIndex).title,
      ),
      drawer: drawerWidget(context),
      body: _tabBarConfig.elementAt(_selectedIndex).widget,
      bottomNavigationBar: BottomNavigationBar(
        items: _tabBarConfig
            .map<BottomNavigationBarItem>(
                (item) => item.bottomNavigationBarItem)
            .toList(),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
