// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'screens/screens.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
  final int index = 10;
}

class _HomeState extends State<Home> {
  int _navbarIndex = 0;

  List<Widget> appPages = [
    const Home(),
    const WeeklyForecastScreen(),
    SearchLocationScreen(),
  ];
  void _itemOnTapped(index) {
    setState(() {
      _navbarIndex = index;
    });
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => appPages[_navbarIndex],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appPages[
        //TODO: tab index
      ],
    );
  }
}
