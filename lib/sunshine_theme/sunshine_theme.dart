import 'package:flutter/material.dart';
import 'package:sunshine/sunshine_theme/palette.dart';

class SunshineTheme {
  static ThemeData themeData() {
    return ThemeData(
      // ignore: prefer_const_constructors
      appBarTheme: AppBarTheme(
          color: Palette.primaryColor,
          elevation: 2.0,
          shadowColor: Palette.activeCardColor,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 22,
          )),
      scaffoldBackgroundColor: Palette.primaryColor,
      textTheme: SunshineTheme.textTheme,

      // ignore: prefer_const_constructors
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.black,
        backgroundColor: Colors.white,
      ),
    );
  }

  static TextTheme textTheme = const TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 30,
    ),
    headline2: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
    headline5: TextStyle(
      color: Colors.white,
      fontSize: 22,
    ),
    headline6: TextStyle(
      color: Colors.white,
      fontSize: 13,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 20,
      color: Colors.white,
    ),
    bodyText2: TextStyle(
      fontSize: 17,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontSize: 15,
      color: Colors.white,
    ),
  );
}
