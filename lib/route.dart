part of 'main.dart';

/// 路由 Hash
Map<String, Widget> get routeMap => {
      '/': MyHome(),
      '/page': ComponentPage(),
      '/setting': SettingsPage(),
      '/test/textTheme': TextThemeTest(),
      '/test/title': TitleTest(),
      '/test/paragraph': ParagraphTest(),
      '/test/image': ImageTest(),
    };
