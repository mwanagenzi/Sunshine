// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/provider/navbar_tab_manager.dart';
import 'screens/screens.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
  final int index = 10;
}

class _HomeState extends State<Home> {
  List<Widget> appPages = [
    const Home(),
    const WeeklyForecastScreen(),
    SearchLocationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarTabManager>(
      builder: ((context, navbarTabManager, child) {
        return appPages[navbarTabManager.selectedTab];
      }),
    );
  }
}
