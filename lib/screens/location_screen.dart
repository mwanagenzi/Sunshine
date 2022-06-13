import 'package:flutter/material.dart';
import 'package:sunshine/api/weather_api_service.dart';
import 'package:sunshine/models/models.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import '../widgets/widgets.dart';

class LocationScreen extends StatefulWidget {
  final List<double> searchLocationCoordinatesData;
  const LocationScreen({Key? key, required this.searchLocationCoordinatesData})
      : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

enum Menu { save, discard }

class _LocationScreenState extends State<LocationScreen> {
  final searchLocationWeatherService = WeatherAPIService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: searchLocationWeatherService
            .getSearchLocationWeatherData(widget.searchLocationCoordinatesData),
        builder: (context, AsyncSnapshot<SearchLocationWeatherData> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final weatherElementData = snapshot.data?.currentWeatherData;

            return Scaffold(
              appBar: AppBar(
                actions: [
                  PopupMenuButton<Menu>(
                    position: PopupMenuPosition.under,
                    elevation: 1.0,
                    child: const Icon(Icons.more_vert),
                    itemBuilder: (context) => <PopupMenuEntry<Menu>>[
                      const PopupMenuItem<Menu>(
                        child: Text(
                          'Save',
                          // style: Theme.of(context).textTheme.bodyText2
                        ),
                        value: Menu.save,
                      ),
                      const PopupMenuDivider(),
                      const PopupMenuItem<Menu>(
                        child: Text(
                          'Discard',
                          // style: Theme.of(context).textTheme.bodyText2
                        ),
                        value: Menu.discard,
                      ),
                    ],
                  )
                ],
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
            return const Center(
              child: CircularProgressIndicator(
                color: Palette.activeCardColor,
              ),
            );
          }
        });
  }
}

//TODO include an option to save or discard
//TODO Let there be an alert after 5 seconds upon loading the searched location data