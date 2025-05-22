

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final providerThemeMode = NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);

class ThemeModeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() {
    return ThemeMode.dark;
  }
  void toggleTheme() => state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  void setThemeDark() => state = ThemeMode.dark;
  void setThemeLight() => state = ThemeMode.light;
}