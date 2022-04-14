import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sunshine/models/current_weather_model.dart';
import 'package:sunshine/models/daily_weather_data.dart';
import 'package:sunshine/models/hourly_weather_model.dart';

class MockWeatherService {
  Future<DailyWeatherData> getDailyWeatherData() async {
    final currentWeather = await _getCurrentWeatherData();
    final hourlyWeatherConditions = await _getHourlyWeatherData();
    return DailyWeatherData(currentWeather, hourlyWeatherConditions);
  }

  Future<CurrentWeatherModel> _getCurrentWeatherData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    final weatherDataString = await _loadAssetSampleData(
        'assets/sample_data/current_weather_data.json');

    final Map<String, dynamic> jsonMap = jsonDecode(weatherDataString);

    if (jsonMap['location']['name'].toString().isNotEmpty) {
      final currentWeatherData = CurrentWeatherModel.fromJson(jsonMap);
      return currentWeatherData;
    } else {
      return CurrentWeatherModel(
          locationName: 'unavailable',
          currentDate: DateFormat.yMEd().format(DateTime.now()),
          temperature: 0,
          windSpeed: 0,
          humidity: 0);
    }
  }

  Future<List<HourlyWeather>> _getHourlyWeatherData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    final hourlyWeatherDataString = await _loadAssetSampleData(
        'assets/sample_data/hourly_weather_data.json');

    final Map<String, dynamic> jsonMap = jsonDecode(hourlyWeatherDataString);

    if (jsonMap['forecast']['forecastday'][0]['hour'] != null) {
      final hours = <HourlyWeather>[];
      jsonMap['forecast']['forecastday'][0]['hour'].forEach(
        (hour) {
          hours.add(
            HourlyWeather.fromJson(hour),
          );
        },
      );
      return hours;
    } else {
      return [];
    }
  }

  Future<String> _loadAssetSampleData(String path) async {
    return rootBundle.loadString(path);
  }
}
