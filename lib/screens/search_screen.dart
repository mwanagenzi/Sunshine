import 'package:flutter/material.dart';
import 'package:sunshine/home.dart';

import 'weekly_forecast_screen.dart';

// ignore: must_be_immutable
class SearchLocationScreen extends StatefulWidget {
  SearchLocationScreen({Key? key}) : super(key: key);
  int itemsIndex = 7;

  @override
  _SearchLocationScreenState createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
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
      appBar: AppBar(
        backgroundColor: const Color(0xFF080A33),
        toolbarHeight: 100,
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text('Pick Location'),
      ),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFF080A33),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Flexible(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      flex: 5,
                      child: TextFormField(
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                            hintText: 'Search',
                            // ignore: prefer_const_constructors
                            hintStyle: TextStyle(
                              color: Colors.white,
                            ),
                            prefixIcon: const Icon(
                              Icons.search_rounded,
                              color: Colors.white,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: const Color(
                                0xFF222249), //TODO : Add this to the theme settings
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            )),
                        cursorColor: Colors.white,
                        //TODO: Validate input
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        padding: const EdgeInsets.all(15),

                        decoration: BoxDecoration(
                          color: const Color(0xFF222249),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        // ignore: prefer_const_constructors
                        child: Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                flex: 4,
                child: buildSavedLocations(),
              )
            ],
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

  Widget buildSavedLocations() {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: widget.itemsIndex,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return LocationWeatherCard();
        });
  }
}

class LocationWeatherCard extends StatelessWidget {
  const LocationWeatherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
          color: const Color(0xFF4286E6),
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    '32\u2103',
                    // ignore: unnecessary_const
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cloudy',
                    // ignore: unnecessary_const
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 15,
              ),
              // ignore: prefer_const_constructors
              FlutterLogo(
                size: 35,
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 20),
          const Text(
            'Carlifornia',
            // ignore: unnecessary_const
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
