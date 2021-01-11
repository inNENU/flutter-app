import 'package:fluro/fluro.dart';
import 'package:innenu/router/i_router.dart';

import 'package:innenu/drawer/pages/about.dart';
import 'package:innenu/drawer/pages/setting.dart';

class DrawerRouter implements IRouterProvider {
  static String aboutPage = '/about';
  static String settingPage = '/setting';

  @override
  void initRouter(FluroRouter router) {
    router
      ..define(aboutPage, handler: Handler(handlerFunc: (_, __) => AboutPage()))
      ..define(settingPage,
          handler: Handler(handlerFunc: (_, __) => SettingsPage()));
  }
}
