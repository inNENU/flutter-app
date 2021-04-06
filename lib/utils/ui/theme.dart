import 'package:flutter/material.dart';
import '../storage.dart';
import '../tool.dart';

final _themeModeMap = Tool.string2EnumMap<ThemeMode>(ThemeMode.values,
    defaultValue: ThemeMode.system);

Future<ThemeMode> getThemeMode() async {
  final themeType = await Storage.getStringKey('theme') ?? 'system';

  return _themeModeMap(themeType);
}

Future<void> setThemeMode(String thememode) async {
  await Storage.setStringKey('theme', thememode);
}
