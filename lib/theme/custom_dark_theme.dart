import 'package:PersonalToolbag/theme/constants.dart';
import 'package:flutter/material.dart';

class CustomDarkTheme {
  static final ThemeData theme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppConstants.dark,
    appBarTheme: _appBarTheme(),
    textTheme: _textTheme.apply(
      fontFamily: 'Poppins',
    ),
  );

  static final TextTheme _textTheme = TextTheme(
    bodyText1: TextStyle(
      fontSize: 15,
      color: AppConstants.lightGrey,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      fontSize: 13,
      color: AppConstants.lightGrey,
      fontWeight: FontWeight.normal,
    ),
    caption: TextStyle(
      fontSize: 12,
      color: AppConstants.lightGrey,
      fontWeight: FontWeight.normal,
    ),
    headline4: TextStyle(
      fontSize: 30,
      color: AppConstants.lightGrey,
      fontWeight: FontWeight.w500,
    ),
    headline5: TextStyle(
      fontSize: 23,
      color: AppConstants.lightGrey,
      fontWeight: FontWeight.normal,
    ),
    headline6: TextStyle(
      fontSize: 19,
      color: AppConstants.lightGrey,
      fontWeight: FontWeight.w500,
    ),
    button: TextStyle(
      fontSize: 18,
      color: AppConstants.lightGrey,
      fontWeight: FontWeight.w500,
    ),
  );

  static AppBarTheme _appBarTheme() => AppBarTheme(
        brightness: Brightness.dark,
        elevation: 0,
        color: AppConstants.dark,
        iconTheme: IconThemeData(
          color: AppConstants.light,
        ),
      );
}
