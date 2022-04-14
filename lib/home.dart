// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/provider/navbar_tab_manager.dart';
import 'models/current_weather_model.dart';
import 'screens/screens.dart';
import 'services/location_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
  final int index = 10;
}

class _HomeState extends State<Home> {
  List<Widget> appPages = [
    HomeScreen(),
    const WeeklyForecastScreen(),
    SearchLocationScreen(),
  ];

  @override
  void initState() {
    super.initState();
    //TODO: Launch location service
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarTabManager>(
      builder: ((context, navbarTabManager, child) {
        return Scaffold(
          body: appPages[navbarTabManager.selectedTab],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              navbarTabManager.goToTab(index);
            },
            currentIndex: navbarTabManager.selectedTab,
            selectedItemColor: const Color(0xFF080A33),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_outlined), label: 'Forecast'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.search_outlined), label: 'Search'),
            ],
          ),
        );
      }),
    );
  }
}
