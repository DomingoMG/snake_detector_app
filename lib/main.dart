import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:snake_detector/config/themes/theme_dark.dart';
import 'package:snake_detector/presentation/providers/app_navigation_notifier.dart';
import 'package:snake_detector/presentation/providers/theme_mode_notifier.dart';

void main() {
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(providerThemeMode);
    return MaterialApp.router(
      routerConfig: ref.watch(providerAppNavigation),
      themeMode: themeMode,
      theme: themeMode == ThemeMode.dark 
        ? AppTheme.darkTheme
        : AppTheme.lightTheme,
    );
  }
}
