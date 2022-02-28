import 'package:flutter/material.dart';
import 'package:sunshine/sunshine_theme/palette.dart';

import '../services/location_service.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final LocationService _locationService = LocationService();
  // @override
  // void initState() {
  //   super.initState();
  //   _locationService.getCurrentLocationCoordinates();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.primaryColor,
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
              style: TextStyle(fontSize: 12), //TODO : textTheme caption
            ),
          ],
        ),
      ),
      body: Container(
        color: Palette.primaryColor, //container or card background color
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
                        backgroundColor: MaterialStateProperty.all(Palette
                                .activeCardColor //TODO : highlighted button color
                            ),
                      ),
                      onPressed: () {
                        //TODO : Forecast details
                      },
                      // ignore: prefer_const_constructors
                      child: const Text(
                        'Forecast',
                        style: TextStyle(color: Colors.white),
                      ),
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
                const FlutterLogo(size: 200.0),
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
                          // ignore: unnecessary_const
                          style: const TextStyle(
                            fontSize: 12, //TODO textTheme - caption
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '32\u2103',
                          // ignore: unnecessary_const
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize:
                                18, //TODO : textTheme headline6 or subtitle1
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
                          // ignore: unnecessary_const
                          style: const TextStyle(
                            fontSize: 12, //TODO textTheme - caption
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '10 km/h',
                          // ignore: unnecessary_const
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20, //TODO textTheme - headline 6
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
                          // ignore: unnecessary_const
                          style: const TextStyle(
                            fontSize: 12, //TODO textTheme - caption
                            color: Colors.white,
                          ),
                        ),
                        const Text(
                          '75%',
                          // ignore: unnecessary_const
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20), //TODO textTheme - headline6
                        ),
                      ],
                    )
                  ],
                ),
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
                        fontSize: 20, //TODO textTheme - headline6
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
                          fontSize: 12, //TODO textTheme - caption
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
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFF4286E6),
                          shape: BoxShape.rectangle,
                          // RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          // ),
                        ),
                        child: const HourlyWeatherCard(),
                      );
                    },
                    separatorBuilder: (context, index) {
                      // ignore: prefer_const_constructors
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 10, //TODO : Supply an identifier as an index
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
