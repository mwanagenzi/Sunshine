import 'package:flutter/material.dart';
import 'package:sunshine/screens/screens.dart';
import 'package:sunshine/sunshine_theme/theme.dart';

void main() {
  runApp(const Sunshine());
}

class Sunshine extends StatelessWidget {
  const Sunshine({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SunshineTheme.themeData(),
      home: const WelcomeScreen(),
    );
  }
}
