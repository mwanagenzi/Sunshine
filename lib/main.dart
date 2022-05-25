import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/home.dart';
import 'package:sunshine/provider/navbar_tab_manager.dart';
import 'package:sunshine/sunshine_theme/theme.dart';

void main() {
  runApp(const Sunshine());
}

class Sunshine extends StatelessWidget {
  const Sunshine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SunshineTheme.themeData(),
      home: ChangeNotifierProvider(
        create: (context) => NavbarTabManager(),
        child: const Home(),
      ),
    );
  }
}
