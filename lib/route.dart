part of 'main.dart';

/// 路由 Hash
Map<String, Widget> get routeMap => {
      '/': MyHome(),
      '/page': ComponentPage(),
      '/about': AboutPage(),
      '/setting': SettingsPage(),
      '/test/textTheme': TextThemeTest(),
      '/test/head': HeadTest(),
      '/test/title': TitleTest(),
      '/test/paragraph': ParagraphTest(),
      '/test/image': ImageTest(),
      '/test/list': ListTest(),
    };
