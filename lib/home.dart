// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:sunshine/screens/weekly_forecast_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
  final int index = 10;
}

class _HomeState extends State<Home> {
  int _navbarIndex = 0;

  List<Widget> appPages = [const Home(), const WeeklyForecastScreen()];
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
      appBar: AppBar(
        backgroundColor: const Color(0XFF080A33),
        toolbarHeight: 100,
        centerTitle: true,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text('San Fransisco'),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 10,
            ),
            const Text(
              'May 28, 2021',
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
      body: Container(
        color: const Color(0xFF080A33),
        //Reference sunshine_app.jpg

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OutlinedButton(
                      // ignore: prefer_const_constructors
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFF4286E6),
                        ),
                      ),
                      onPressed: () {
                        //TODO : Forecast details
                      },
                      // ignore: prefer_const_constructors
                      child: const Text('Forecast',
                          style: TextStyle(color: Colors.white)),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        //TODO : Air quality details, fetch from another design
                      },
                      child: const Text(
                        'Air quality',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const FlutterLogo(size: 400.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Temp',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '32\u2103',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Wind',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '10 km/h',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Text(
                          'Humidity',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '75%',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                Row(
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
                        'View full report',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Color(0xFF4286E8),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 80,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF4286E6),
                            shape: BoxShape.rectangle,
                            // RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            // ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // ignore: prefer_const_constructors
                              FlutterLogo(
                                size: 50.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  // ignore: prefer_const_constructors
                                  Text(
                                    '14:00',
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                    // ignore: prefer_const_constructors
                                  ),
                                  // ignore: prefer_const_constructors
                                  Text(
                                    '32\u2103',
                                    // ignore: prefer_const_constructors
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        // ignore: prefer_const_constructors
                        return SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: widget.index),
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
