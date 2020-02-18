import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'components/index.dart';
import 'pages/index.dart';
import 'tests/index.dart';
import 'utils/index.dart';

part 'route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /// App 标题
  static const String _title = 'in东师';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //  GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CN'),
        const Locale('en', 'US'),
      ],
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
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      'in东师',
                      style: Theme.of(context).textTheme.display1,
                    ),
                  ),
                  ListTile(
                      leading: Icon(Icons.tune),
                      title: const Text('设置'),
                      onTap: () {
                        Navigator.pushNamed(context, '/setting');
                      })
                ]),
          ),
        ],
      )),
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
