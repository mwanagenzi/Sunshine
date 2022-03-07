import 'package:flutter/material.dart';
import 'package:sunshine/models/current_weather_model.dart';
import 'package:sunshine/sunshine_theme/palette.dart';

import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double? currentTemp;
  double? currentWindSpeed;
  int? currentHumidity;
  Future<dynamic> fetchCurrentWeatherData() async {
    return await CurrentWeatherModel().fetchCurrentWeatherData();
    // currentTemp = currentWeatherData['current']['temp_c'];
    // currentWindSpeed = currentWeatherData['current']['temp_f'];
    // currentHumidity = currentWeatherData['current']['humidity'];
    // print("windspeed : $currentWindSpeed, humidity: $currentHumidity");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      fetchCurrentWeatherData();
    });
  }

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
                          "Temp",
                          // ignore: unnecessary_const
                          style: const TextStyle(
                            fontSize: 12, //TODO textTheme - caption
                            color: Colors.white,
                          ),
                        ),
                        buildFutureData(jsonField: 'temp_c')
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
                        buildFutureData(jsonField: 'wind_kph'),
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
                        buildFutureData(jsonField: 'humidity'),
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
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
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

  Widget buildFutureData({required String jsonField}) {
    return FutureBuilder(
      future: fetchCurrentWeatherData(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final jsonFieldName = snapshot.data?['current'][jsonField];
          return Text(
            jsonFieldName.toString(),
            // ignore: unnecessary_const
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18, //TODO : textTheme headline6 or subtitle1
            ),
          );
        } else {
          return const CircularProgressIndicator(
            color: Palette.activeCardColor,
          );
        }
      },
    );
  }
}
