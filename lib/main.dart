import 'package:flutter/material.dart';
import 'package:innenu/component/index.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'in东师';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(
        primaryColor: Colors.greenAccent[400],
      ),
      home: MyHome(),
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
    this.bottomNavigationBarItem = BottomNavigationBarItem(
      icon: this.icon,
      title: this.title,
    );
  }
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<NavigationBarConfig> _config = [
    NavigationBarConfig(
      MyParagraph(text: '主页'),
      // Text(
      //   '主页',
      //   style: optionStyle,
      // ),
      title: '主页',
      icon: Icon(Icons.home),
    ),
    NavigationBarConfig(
      Text(
        '指南',
        style: optionStyle,
      ),
      title: '指南',
      icon: Icon(Icons.lightbulb_outline),
    ),
    NavigationBarConfig(
      Text(
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
                Icons.settings,
                color: Colors.white,
              ),
              onPressed: () {
                // TODO: Make Setting Page
              },
            )
          ]),
      body: Center(
        child: _config.elementAt(_selectedIndex).widget,
      ),
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
