import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/home.dart';
import 'package:sunshine/provider/navbar_tab_manager.dart';
import 'package:sunshine/screens/login_screen.dart';
import 'package:sunshine/screens/reset_password_screen.dart';
import 'package:sunshine/screens/sign_up_screen.dart';
import 'package:sunshine/screens/welcome_screen.dart';
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
      home: ChangeNotifierProvider(
        create: ((context) => NavbarTabManager()),
        child: const WelcomeScreen(),
      ),
    );
  }
}
