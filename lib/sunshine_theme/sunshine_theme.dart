import 'package:flutter/material.dart';

class SunshineTheme {
  static ThemeData light() {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0XFF080A33),
      // ignore: prefer_const_constructors
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: const Color(0XFF080A33),
        backgroundColor: Colors.black,
      ),
    );
  }

  static TextTheme lightTextTheme = const TextTheme(
    
  );
}
