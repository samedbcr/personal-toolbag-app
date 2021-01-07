import 'package:PersonalToolbag/theme/constants.dart';
import 'package:flutter/material.dart';

class CustomLightTheme {
  static final ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: _appBarTheme(),
    fontFamily: 'Poppins',
    textTheme: _textTheme(),
  );

  static TextTheme _textTheme() {
    return TextTheme(
      bodyText1: TextStyle(
        fontSize: 15,
        color: AppConstants.darkGrey,
        fontWeight: FontWeight.normal,
      ),
      bodyText2: TextStyle(
        fontSize: 13,
        color: AppConstants.darkGrey,
        fontWeight: FontWeight.normal,
      ),
      caption: TextStyle(
        fontSize: 12,
        color: AppConstants.darkGrey,
        fontWeight: FontWeight.normal,
      ),
      headline4: TextStyle(
        fontSize: 30,
        color: AppConstants.dark,
        fontWeight: FontWeight.w500,
      ),
      headline5: TextStyle(
        fontSize: 23,
        color: AppConstants.dark,
        fontWeight: FontWeight.normal,
      ),
      headline6: TextStyle(
        fontSize: 19,
        color: AppConstants.dark,
        fontWeight: FontWeight.w500,
      ),
      button: TextStyle(
        fontSize: 18,
        color: AppConstants.dark,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static AppBarTheme _appBarTheme() => AppBarTheme(
        brightness: Brightness.light,
        elevation: 0,
        color: Colors.white,
        iconTheme: IconThemeData(
          color: AppConstants.dark,
        ),
      );
}
