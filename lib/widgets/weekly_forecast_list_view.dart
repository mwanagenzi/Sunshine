import 'package:flutter/material.dart';
import 'package:sunshine/models/daily_forecast_model.dart';
import 'daily_forecast_card.dart';

class WeeklyForecastListView extends StatelessWidget {
  final List<DailyWeatherModel> weeklyWeatherData;

  const WeeklyForecastListView({
    Key? key,
    required this.weeklyWeatherData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((context, index) {
          return DailyForecastCard(
            date: weeklyWeatherData[index].shortDate,
            averageTemp: weeklyWeatherData[index].averageTemperature,
            dayOfWeek: weeklyWeatherData[index].day,
          );
        }),
        separatorBuilder: (context, index) {
          // ignore: prefer_const_constructors
          return SizedBox(
            height: 20,
          );
        },
        itemCount: weeklyWeatherData.length);
  }
}
