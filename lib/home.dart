import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/provider/navbar_tab_manager.dart';
import 'package:sunshine/sunshine_theme/theme.dart';
import 'screens/screens.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Widget> appPages = [
    HomeScreen(),
    const WeeklyForecastScreen(),
    SearchLocationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarTabManager>(
      builder: ((context, navbarTabManager, child) {
        return Scaffold(
          body: IndexedStack(
            index: navbarTabManager.selectedTab,
            children: appPages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              navbarTabManager.goToTab(index);
            },
            currentIndex: navbarTabManager.selectedTab,
            selectedItemColor: Palette.primaryColor,
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
