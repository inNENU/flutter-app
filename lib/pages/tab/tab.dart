import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:innenu/widgets/components/getPage.dart';
import 'package:logging/logging.dart';

import 'package:innenu/pages/tab/config.dart';
import 'package:innenu/pages/tab/drawer.dart';
import 'package:innenu/pages/tab/function.dart';
import 'package:innenu/pages/tab/guide.dart';
import 'package:innenu/pages/tab/intro.dart';
import 'package:innenu/pages/tab/main.dart';

export 'config.dart';

final _logger = Logger('tagPage');

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /// 当前显示的页面索引
  int _selectedIndex = 0;

  /// Tab Bar 配置
  final List<NavigationBarConfig> _tabBarConfig = [
    mainPageWidget,
    introPageWidget,
    guidePageWidget,
    functionPageWidget,
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
      case 'intro':
        return 1;
      case 'guide':
        return 2;
      case 'function':
        return 3;
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
        return 'intro';
      case 2:
        return 'guide';
      case 3:
        return 'function';
      default:
        _logger.warning('Illegal index: $index, index should only be 0,1,2.');
        return 'main';
    }
  }

  /// 刷新页面
  void refreshPage() {
    final base = 'https://mp.innenu.com/resource/config/wx33acb831ee1831a5';

    // 获取最新版本号
    Dio().get<String>('$base/version.json').then((response) {
      if (response.statusCode == 200) {
        final version = jsonDecode(response.data) as String;
        final url = '$base/$version';

        updatePage(url, 'main');
        updatePage(url, 'guide');
        updatePage(url, 'intro');
      } else {
        _logger.shout('Get app version fail');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    refreshPage();
  }

  /// 切换页面
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageName = getPageNameFromIndex(index);
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(_tabBarConfig.elementAt(_selectedIndex).label),
        ),
        drawer: drawerWidget(context),
        body: _tabBarConfig.elementAt(_selectedIndex).widget,
        bottomNavigationBar: BottomNavigationBar(
          items: _tabBarConfig
              .map<BottomNavigationBarItem>(
                  (item) => item.bottomNavigationBarItem)
              .toList(),
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: const Color(0xff888888),
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      );
}
