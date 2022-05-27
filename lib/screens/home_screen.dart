import 'package:flutter/material.dart';
import 'package:sunshine/api/mock_weather_service.dart';
import 'package:sunshine/api/weather_api_service.dart';
import 'package:sunshine/models/daily_weather_data.dart';
import 'package:sunshine/services/location_service.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentWeatherService = WeatherAPIService();

  @override
  void initState() async {
    await LocationService().checkLocationPermission();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: currentWeatherService.getDailyWeatherData(),
        builder: (context, AsyncSnapshot<DailyWeatherData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final weatherElementData = snapshot.data?.currentWeatherData;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Palette.primaryColor,
                centerTitle: true,
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      weatherElementData?.locationName ?? '',
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      weatherElementData?.currentDate ?? '',
                      style: const TextStyle(
                          fontSize: 12), //TODO : textTheme caption
                    ),
                  ],
                ),
              ),
              body: Container(
                color:
                    Palette.primaryColor, //container or card background color
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
                                    Palette.activeCardColor),
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
                        Image(
                          height: 200,
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(
                            //TODO: Implement cache network image package
                            weatherElementData?.imageUrl ??
                                'https://img.icons8.com/pastel-glyph/2x/error--v3.png',
                            // 'https://cdn.weatherapi.com/weather/64x64/day/113.png'
                            // 'https://imgs.search.brave.com/NmwONYNXckjeLWZ-6QxOU0uhTGg0flhVIoQLzi-ycUM/rs:fit:416:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5j/ZXZoRHhPVFhnTzZN/OGdNc00tMWFBSGFJ/YiZwaWQ9QXBp',
                            //loads flutter logo as default image
                          ),
                        ),
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
                                Text(
                                  '${weatherElementData?.temperature.toString() ?? 0.toString()} \u2103',
                                  // ignore: unnecessary_const
                                  style: Theme.of(context).textTheme.headline3,
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
                                Text(
                                  '${weatherElementData?.windSpeed.toString() ?? 0.toString()} kph',
                                  // ignore: unnecessary_const
                                  style: Theme.of(context).textTheme.headline3,
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
                                Text(
                                  '${weatherElementData?.humidity.toString() ?? 0.toString()}%',
                                  // ignore: unnecessary_const
                                  style: Theme.of(context).textTheme.headline3,
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
                        // ignore: prefer_const_constructors
                        SizedBox(
                          height: 80,
                          child: HourlyWeatherListView(
                              hourlyWeatherData:
                                  snapshot.data?.hourlyWeatherData ?? []),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(
                //TODO : implement spinkit progress indicator
                color: Palette.activeCardColor,
              ),
            );
          }
        });
  }
}
