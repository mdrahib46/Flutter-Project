import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;

  ThemeMode get themeMode => _themeMode;

  ThemeModeProvider() {
    _loadTheme();
  }

  Future<void> toggleTheme() async {
    _themeMode =
    _themeMode == ThemeMode.dark
        ? ThemeMode.light
        : ThemeMode.dark;

    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme-mode', _themeMode.name);
  }

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final savedTheme = prefs.getString('theme-mode');

    if (savedTheme != null) {
      _themeMode = ThemeMode.values.firstWhere(
            (mode) => mode.name == savedTheme,
        orElse: () => ThemeMode.system,
      );

      notifyListeners();
    }
  }
}