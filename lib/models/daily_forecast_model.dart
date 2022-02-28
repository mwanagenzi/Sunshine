import 'package:flutter/material.dart';

class DailyWeatherModel {
  String shortDate;
  String day;
  String averageTemperature;
  Image dayWeatherIcon;

  DailyWeatherModel({
    required this.shortDate,
    required this.day,
    required this.averageTemperature,
    required this.dayWeatherIcon,
  });
}
