import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
            final weatherData = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: 100,
                centerTitle: true,
                title: const Text('Forecast Report'),
              ),
              body: Container(
                color: Palette.primaryColor,
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
                              Text('Today',
                                  style: Theme.of(context).textTheme.headline2),
                              InkWell(
                                child: Text(
                                  DateFormat.E().add_yMMMMd().format(
                                        DateTime.now(),
                                      ),
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4
                                      ?.copyWith(
                                          color: Palette.highlightedTextColor),
                                ),
                              ),
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
                              Text('This week',
                                  style: Theme.of(context).textTheme.headline2),
                              const Icon(
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
              child: Text('Still loading',
                  style: Theme.of(context).textTheme.headline3),
            );
          }
        });
  }
}
