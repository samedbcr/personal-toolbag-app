import 'package:PersonalToolbag/theme/custom_dark_theme.dart';
import 'package:PersonalToolbag/theme/custom_light_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = CustomLightTheme.theme;
  bool _isDark = false;
  ThemeData get getTheme => _theme;
  bool get isDark => _isDark;

  void changeTheme() {
    if (_isDark) {
      _theme = CustomLightTheme.theme;
    } else {
      _theme = CustomDarkTheme.theme;
    }
    _isDark = !isDark;
    notifyListeners();
  }
}
