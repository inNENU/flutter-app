import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

// import 'components/index.dart';
import 'pages/index.dart';
import 'tests/index.dart';
import 'utils/index.dart';

part 'route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  /// App 标题
  static const String _title = 'in东师';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        //  GlobalCupertinoLocalizations.delegate,
      ],
      themeMode: ThemeMode.system,
      supportedLocales: [
        const Locale('zh', 'CN'),
        const Locale('en', 'US'),
      ],
      initialRoute: '/',
      onGenerateRoute: (settings) => settings.name == '/'
          // 无动画
          ? PageRouteBuilder<dynamic>(
              pageBuilder: (context, animation1, animation2) => MyHome())
          // 滑动动画
          : SlidePageRoute<dynamic>(routeMap[settings.name]),
      theme: ThemeData(
        primaryColor: Colors.greenAccent[400],
      ),
      darkTheme: ThemeData(
          primaryColor: Colors.greenAccent[400], brightness: Brightness.dark),
    );
  }
}
