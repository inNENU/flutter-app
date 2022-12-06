import 'package:flutter/material.dart';
import '../storage.dart';
import '../tool.dart';

final _themeModeMap = stringToEnumMap<ThemeMode>(ThemeMode.values,
    defaultValue: ThemeMode.system);

Future<ThemeMode> getThemeMode() async {
  final themeType = await getStringKey('theme') ?? 'system';

  return _themeModeMap(themeType);
}

Future<void> setThemeMode(String themeMode) async {
  await setStringKey('theme', themeMode);
}
