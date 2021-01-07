import 'package:PersonalToolbag/theme/constants.dart';
import 'package:flutter/material.dart';

class CustomLightTheme {
  static final ThemeData theme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: _appBarTheme(),
  );

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      brightness: Brightness.light,
      elevation: 0,
      color: Colors.white,
      iconTheme: IconThemeData(
        color: AppConstants.dark,
      ),
    );
  }
}
