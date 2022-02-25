import 'package:flutter/material.dart';
import 'package:sunshine/sunshine_theme/palette.dart';

class SunshineTheme {
  static ThemeData themeData() {
    return ThemeData(
      // ignore: prefer_const_constructors
      appBarTheme: AppBarTheme(
        color: Palette.primaryColor,
        elevation: 2.0,
        shadowColor: const Color(0xFF4286E6),
      ),
      scaffoldBackgroundColor: const Color(0XFF080A33),
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
    ), //degrees celsius daily forecast card
    headline2: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ), //weather element label
    headline3: TextStyle(
      color: Colors.white,
      fontSize: 18,
    ), //hourly weather card degrees celsius

    headline4: TextStyle(
      color: Colors.white,
      fontSize: 12,
    ), //weathericonlabel
    headline5: TextStyle(
      color: Colors.white,
      fontSize: 22, //TODO textTheme headline5
    ),//location weather temperature
    // ignore: unnecessary_const
    bodyText1: const TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 20, //TODO textTheme - headline6
      color: Colors.white,
    ),
    // ignore: unnecessary_const
    bodyText2: const TextStyle(
      fontSize: 15, //TODO : textTheme body2
      color: Colors.white,
    ),
  );
}
