import 'package:flutter/material.dart';
import 'package:sunshine/screens/search_screen.dart';

import '../home.dart';
import '../widgets/widgets.dart';

class WeeklyForecastScreen extends StatefulWidget {
  const WeeklyForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyForecastScreen> createState() => _WeeklyForecastScreenState();
}

class _WeeklyForecastScreenState extends State<WeeklyForecastScreen> {
  int _navbarIndex = 0;
  List<Widget> appPages = [
    const Home(),
    const WeeklyForecastScreen(),
    SearchLocationScreen()
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
    int todayForecastItems = 10;
    int weeklyForecastItems = 7;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF080A33),
        toolbarHeight: 100,
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text('Forecast Report'),
      ),
      body: Container(
        color: const Color(0xFF080A33),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        'Today',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      // ignore: prefer_const_constructors
                      InkWell(
                        onTap: () {
                          //TODO : Open week forecast screen
                        },
                        // ignore: prefer_const_constructors
                        child: Text(
                          '${DateTime.now()}', //TODO : Format this date to match design
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF4286E8),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: const BoxDecoration(
                            color: Color(0xFF4286E6),
                            shape: BoxShape.rectangle,
                            // RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            // ),
                          ),
                          child: HourlyWeatherCard(),
                        );
                      },
                      separatorBuilder: (context, index) {
                        // ignore: prefer_const_constructors
                        return SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: todayForecastItems),
                ),
                Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Text(
                        'This week',
                        style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),

                      // ignore: prefer_const_constructors
                      Icon(
                        Icons.calendar_today,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 6,
                  fit: FlexFit.tight,
                  child: ListView.separated(
                      itemBuilder: ((context, index) {
                        return DailyForecastCard();
                      }),
                      separatorBuilder: (context, index) {
                        // ignore: prefer_const_constructors
                        return SizedBox(
                          height: 20,
                        );
                      },
                      itemCount: weeklyForecastItems),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _itemOnTapped,
        currentIndex: _navbarIndex,
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
  }
}

