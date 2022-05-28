import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sunshine/api/mock_weather_service.dart';
import 'package:sunshine/api/weather_api_service.dart';
import 'package:sunshine/models/weekly_forecast_model.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import 'package:sunshine/widgets/weekly_forecast_list_view.dart';
import '../widgets/widgets.dart';

class WeeklyForecastScreen extends StatefulWidget {
  const WeeklyForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyForecastScreen> createState() => _WeeklyForecastScreenState();
}

class _WeeklyForecastScreenState extends State<WeeklyForecastScreen> {
  final weeklyWeatherDataService = WeatherAPIService();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: weeklyWeatherDataService.getWeeklyWeatherData(),
        builder: (context, AsyncSnapshot<WeeklyForecastData> snapshot) {
          final weatherData = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: Palette.activeCardColor,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                style: Theme.of(context).textTheme.headline3,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            print(
                "Hourly Weather Data from weekly forecast screen : ${weatherData.toString()}");
            return Scaffold(
              appBar: AppBar(
                backgroundColor:
                    const Color(0XFF080A33), //TODO scaffold background color
                toolbarHeight: 100,
                centerTitle: true,
                // ignore: prefer_const_constructors
                title: Text('Forecast Report'),
              ),
              body: Container(
                color: const Color(0xFF080A33), //TODO primary color
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
                                ), //TODO textTheme headline6
                              ),
                              // ignore: prefer_const_constructors
                              InkWell(
                                // ignore: prefer_const_constructors
                                child: Text(
                                  DateFormat.E().add_yMMMMd().format(
                                        DateTime.now(),
                                      ),
                                  style: const TextStyle(
                                    fontSize: 12, //TODO textTheme - caption
                                    color: Color(
                                        0xFF4286E8), //TODO textTheme - highlighted text color
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: HourlyWeatherListView(
                            hourlyWeatherData:
                                weatherData?.hourlyWeatherData ?? [],
                          ),
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
                                  fontSize: 20, //TODO textTheme - headline6
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
                          child: WeeklyForecastListView(
                            weeklyWeatherData:
                                weatherData?.dailyWeatherData ?? [],
                          ),
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
