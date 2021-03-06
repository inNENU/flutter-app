import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:sp_util/sp_util.dart';

import 'package:innenu/pages/tab/tab.dart';
import 'package:innenu/utils/info.dart';
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
  MyApp() {
    Routes.initRoutes();
  }

  /// App 标题
  static const String _title = 'in 东师';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: _title,

        // 多语言设置
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          //  GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('zh', 'CN'),
          Locale('en', 'US'),
        ],
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child,
        ),

        home: const Home(),
        onGenerateRoute: Routes.router.generator,

        /// 因为使用了 fluro，这里设置主要针对 Web
        onUnknownRoute: (_) => MaterialPageRoute<dynamic>(
          builder: (context) => NotFoundPage(),
        ),

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
