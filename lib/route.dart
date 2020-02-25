part of 'main.dart';

/// 路由 Hash
Map<String, Widget> get routeMap => {
      '/': MyHome(),
      '/about': AboutPage(),
      '/setting': SettingsPage(),
      '/test/textTheme': TextThemeTest(),
      '/test/foot': FootTest(),
      '/test/grid': GridTest(),
      '/test/head': HeadTest(),
      '/test/title': TitleTest(),
      '/test/paragraph': ParagraphTest(),
      '/test/image': ImageTest(),
      '/test/list': ListTest(),
    };
