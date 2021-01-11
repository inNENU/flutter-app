import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:innenu/router/i_router.dart';
import 'package:innenu/router/not_found_page.dart';

import 'package:innenu/drawer/router/router.dart';
import 'package:innenu/tests/router/router.dart';

import 'package:innenu/pages/webview_page.dart';
import 'package:innenu/pages/tab/tab.dart';

// ignore: avoid_classes_with_only_static_members
class Routes {
  static String home = '/home';
  static String webViewPage = '/webView';

  static final List<IRouterProvider> _listRouter = [];

  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(handlerFunc: (context, params) {
      debugPrint('页面不存在');
      return NotFoundPage();
    });

    router
      ..define(home,
          handler: Handler(handlerFunc: (context, params) => const Home()))
      ..define(webViewPage, handler: Handler(handlerFunc: (_, params) {
        final title = params['title']?.first;
        final url = params['url']?.first;
        return WebViewPage(title: title, url: url);
      }));

    _listRouter
      ..clear()
      // 各自路由由各自模块管理，统一在此添加初始化
      ..add(DrawerRouter())
      ..add(TestRouter());

    // 初始化路由
    for (final routerProvider in _listRouter) {
      routerProvider.initRouter(router);
    }
  }
}
