import 'package:flutter/material.dart';

class DailyForecastModel {
  String shortDate;
  String day;
  String averageTemperature;
  Image dayWeatherIcon;

  DailyForecastModel({
    required this.shortDate,
    required this.day,
    required this.averageTemperature,
    required this.dayWeatherIcon,
  });
}
