import 'package:flutter/material.dart';

import 'config.dart';
import 'drawer.dart';
import 'function.dart';
import 'guide.dart';
import 'main.dart';

export 'config.dart';

/// Tab Bar 配置
final List<NavigationBarConfig> _tabBarConfig = [
  mainPageWidget,
  guidePageWidget,
  functionPageWidget,
];

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;

  /// 设置页码
  set page(String page) {
    switch (page) {
      case 'main':
        _selectedIndex = 0;
        break;
      case 'function':
        _selectedIndex = 1;
        break;
      case 'guide':
        _selectedIndex = 2;
        break;
      default:
      // TODO: Error log here
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
        items: List.generate(_tabBarConfig.length,
            (index) => _tabBarConfig[index].bottomNavigationBarItem),
        currentIndex: _selectedIndex,
        // selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
