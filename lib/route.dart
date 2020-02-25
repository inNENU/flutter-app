part of 'main.dart';

/// 路由 Hash
Map<String, Widget> get routeMap => {
      '/': MyHome(),
      '/about': AboutPage(),
      '/setting': SettingsPage(),
      '/test/textTheme': TextThemeTest(),
      '/test/foot': FootTest(),
      '/test/footJSON': FootJSONTest(),
      '/test/grid': GridTest(),
      '/test/gridJSON': GridJSONTest(),
      '/test/head': HeadTest(),
      '/test/headJSON': HeadJSONTest(),
      '/test/title': TitleTest(),
      '/test/titleJSON': TitleJSONTest(),
      '/test/paragraph': ParagraphTest(),
      '/test/paragraphJSON': ParagraphJSONTest(),
      '/test/image': ImageTest(),
      '/test/imageJSON': ImageJSONTest(),
      '/test/list': ListTest(),
      '/test/listJSON': ListJSONTest(),
    };
