import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/home.dart';
import 'package:sunshine/provider/navbar_tab_manager.dart';
import 'package:sunshine/screens/screens.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: ((context) => NavbarTabManager()),
        child: const HomeScreen(),
      ),
    );
  }
}
