import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sp_util/sp_util.dart';

import 'package:innenu/pages/tab/tab.dart';
import 'package:innenu/utils/device.dart';
import 'package:innenu/router/not_found_page.dart';
import 'package:innenu/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // shared_preferences 初始化
  await SpUtil.getInstance();

  runApp(MyApp());

  // 透明状态栏
  if (DeviceInfo.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatelessWidget {
  /// App 标题
  static const String _title = 'in东师';

  MyApp() {
    Routes.initRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,

      // 多语言设置
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //  GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CN'),
        const Locale('en', 'US'),
      ],
      builder: (context, child) {
        /// 保证文字大小不受手机系统设置影响 https://www.kikt.top/posts/flutter/layout/dynamic-text/
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child,
        );
      },

      // 路由设置
      // initialRoute: '/',
      home: Home(),
      onGenerateRoute: Routes.router.generator,

      /// 因为使用了 fluro，这里设置主要针对 Web
      onUnknownRoute: (_) {
        return MaterialPageRoute<dynamic>(
          builder: (context) => NotFoundPage(),
        );
      },

      /// 主题设置
      theme: ThemeData(
        primaryColor: Colors.greenAccent[400],
      ),

      /// 暗黑主题设置
      darkTheme: ThemeData(
          primaryColor: Colors.greenAccent[400], brightness: Brightness.dark),

      /// 主题模式
      themeMode: ThemeMode.system,
    );
  }
}
