import 'package:flutter/material.dart';
import 'package:sunshine/api/mock_weather_service.dart';
import 'package:sunshine/models/daily_weather_data.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import '../widgets/widgets.dart';

const kElementTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 18, //TODO : set this on the text theme
);

class HomeScreen extends StatelessWidget {
  final currentWeatherService = MockWeatherService();

  HomeScreen({Key? key}) : super(key: key);

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
                      weatherElementData?.locationName.toString() ?? '',
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
                                    Palette
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
                                Text(
                                  weatherElementData?.temperature.toString() ??
                                      '',
                                  // ignore: unnecessary_const
                                  style: kElementTextStyle,
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
                                  weatherElementData?.windSpeed.toString() ??
                                      '',
                                  // ignore: unnecessary_const
                                  style: kElementTextStyle,
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
                                  weatherElementData?.humidity.toString() ?? '',
                                  // ignore: unnecessary_const
                                  style: kElementTextStyle,
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
                color: Palette.activeCardColor,
              ),
            );
          }
        });
  }
}
