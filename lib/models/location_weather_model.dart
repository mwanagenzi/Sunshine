import 'package:flutter/material.dart';

class LocationWeatherModel {
  String averageTemperature;
  String weatherElement;
  String locationName;
  Image locationWeatherIcon;

  LocationWeatherModel({
    required this.averageTemperature,
    required this.weatherElement,
    required this.locationName,
    required this.locationWeatherIcon,
  });
}
