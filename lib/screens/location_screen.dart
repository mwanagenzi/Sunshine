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
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Palette.activeCardColor,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Icon(Icons.more_vert),
                    itemBuilder: (context) => <PopupMenuEntry<Menu>>[
                      PopupMenuItem<Menu>(
                        child: const Text(
                          'Save',
                          // style: Theme.of(context).textTheme.bodyText2
                        ),
                        onTap: () {
                          //TODO: capture the current coordinates
                          //TODO: save the coordinates on user's list of saved locations
                          Navigator.pop(context);
                        },
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
                    Text(weatherElementData?.currentDate ?? '',
                        style: Theme.of(context).textTheme.headline4)
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
                              children: [
                                Text("Temp",
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                Text(
                                  '${weatherElementData?.temperature.toString() ?? 0.toString()} \u2103',
                                  // ignore: unnecessary_const
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Wind',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  '${weatherElementData?.windSpeed.toString() ?? 0.toString()} kph',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Humidity',
                                    // ignore: unnecessary_const
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                Text(
                                  '${weatherElementData?.humidity.toString() ?? 0.toString()}%',
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Today',
                                style: Theme.of(context).textTheme.bodyText1),
                            InkWell(
                              child: Text('View full report',
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ],
                        ),
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
//TODO: choose one of the above options