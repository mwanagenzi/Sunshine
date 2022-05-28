import 'package:flutter/material.dart';
import 'package:sunshine/api/weather_api_service.dart';
import 'package:sunshine/models/daily_weather_data.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final currentWeatherService = WeatherAPIService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: currentWeatherService.getDailyWeatherData(),
        builder: (context, AsyncSnapshot<DailyWeatherData> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                //TODO : implement spinkit progress indicator
                color: Palette.activeCardColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            final weatherElementData = snapshot.data?.currentWeatherData;
            print(
                "Accessing home screen currentWeatherData ${weatherElementData.toString()}");
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
                color: Palette.primaryColor,
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
            return Center(
                child: Text(
              'Still loading',
              style: Theme.of(context).textTheme.headline3,
            ));
          }
        });
  }
}
