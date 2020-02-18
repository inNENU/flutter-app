part of 'main.dart';

/// 路由配置
Map<String, Widget Function(BuildContext)> routeConfig(BuildContext context) =>
    {
      '/': (context) => MyHome(),
      '/page': (context) => ComponentPage(),
      '/setting': (context) => SettingsPage(),
      '/test/textTheme': (context) => TextThemeTest(),
      '/test/title': (context) => TitleTest(),
      '/test/paragraph': (context) => ParagraphTest(),
      '/test/image': (context) => ImageTest(),
    };
