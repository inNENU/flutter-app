import 'package:flutter/material.dart';

import 'components/index.dart';
import 'pages/index.dart';
import 'tests/index.dart';

part 'route.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  /// App 标题
  static const String _title = 'in东师';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      initialRoute: '/',
      routes: routeConfig(context),
      theme: ThemeData(
        primaryColor: Colors.greenAccent[400],
      ),
    );
  }
}

class MyHome extends StatefulWidget {
  MyHome({Key key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

/// 导航栏配置
class NavigationBarConfig {
  /// 对应的标题
  Text title;

  /// 对应的标题
  Widget icon;

  /// 对应的页面
  Widget widget;

  /// 对应的导航栏项配置
  BottomNavigationBarItem bottomNavigationBarItem;

  NavigationBarConfig(this.widget, {String title, this.icon}) {
    this.title = Text(title);
    bottomNavigationBarItem = BottomNavigationBarItem(
      icon: icon,
      title: this.title,
    );
  }
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

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<NavigationBarConfig> _config = [
    NavigationBarConfig(
      ListView(children: [
        // MyHead('主页'),
        MyTitle('主页'),
        MyList([
          MyListConfig(
              text: 'textTheme 测试', desc: 'aaa', url: '/test/textTheme'),
          MyListConfig(text: 'title 测试', desc: 'aaa', url: '/test/title'),
          MyListConfig(
              text: 'paragraph 测试', desc: 'aaa', url: '/test/paragraph'),
          MyListConfig(text: 'image 测试', desc: 'aaa', url: '/test/image'),
          MyListConfig(text: 'aa', desc: 'aaa'),
          MyListConfig(text: 'aa', desc: 'aaa'),
        ]),
        // MyGrid([MyGridConfig(text: 'aa')]),
      ]),
      title: '主页',
      icon: Icon(Icons.home),
    ),
    NavigationBarConfig(
      const Text(
        '指南',
        style: optionStyle,
      ),
      title: '指南',
      icon: Icon(Icons.lightbulb_outline),
    ),
    NavigationBarConfig(
      const Text(
        '功能',
        style: optionStyle,
      ),
      title: '功能',
      icon: Icon(Icons.apps),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _config.elementAt(_selectedIndex).title,
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(
                Icons.tune,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/setting');
                // Navigator.of(context).push(MaterialPageRoute<void>(
                //     builder: (context) => SettingsPage()));
              },
            )
          ]),
      body: _config.elementAt(_selectedIndex).widget,
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
            _config.length, (index) => _config[index].bottomNavigationBarItem),
        currentIndex: _selectedIndex,
        // selectedItemColor: Theme.of(context).primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
