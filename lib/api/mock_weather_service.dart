import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sunshine/models/current_weather_model.dart';

class MockWeatherService {
  Future<CurrentWeatherModel> getCurrentWeatherData() async {
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
          currentDate: DateTime.now(),
          temperature: 0,
          windSpeed: 0,
          humidity: 0);
    }
  }

  Future<String> _loadAssetSampleData(String path) async {
    return rootBundle.loadString(path);
  }
}
