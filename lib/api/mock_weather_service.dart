import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sunshine/models/models.dart';
import 'package:sunshine/models/weekly_forecast_model.dart';

class MockWeatherService {
  Future<DailyWeatherData> getDailyWeatherData() async {
    final currentWeather = await _getCurrentWeatherData();
    final hourlyWeatherConditions = await _getHourlyWeatherData();
    return DailyWeatherData(currentWeather, hourlyWeatherConditions);
  }

  Future<WeeklyForecastData> getWeeklyWeatherData() async {
    final hourlyWeatherData = await _getHourlyWeatherData();
    final dailyForecastData = await _getDailyForecastData();

    return WeeklyForecastData(hourlyWeatherData, dailyForecastData);
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

  Future<List<DailyWeatherModel>> _getDailyForecastData() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    final weeklyForecastDataString = await _loadAssetSampleData(
        'assets/sample_data/weekly_forecast_data.json');

    final Map<String, dynamic> jsonMap = jsonDecode(weeklyForecastDataString);

    if (jsonMap['forecast']['forecastday'] != null) {
      final days = <DailyWeatherModel>[];
      jsonMap['forecast']['forecastday'].forEach(
        (day) {
          days.add(
            DailyWeatherModel.fromJson(day),
          );
        },
      );
      return days;
    } else {
      return [];
    }
  }

  Future<List<SearchResult>> getSearchResultData() async {
    await Future.delayed(const Duration(seconds: 2));

    final searchResultDataString = await _loadAssetSampleData(
        'assets/sample_data/search_result_data.json');

    final List jsonMap = jsonDecode(searchResultDataString);

    print("This is the jsonMap : $jsonMap");

    if (jsonMap[0]['name'] != null) {
      final searchResultListData = <SearchResult>[];

      for (var searchResult in jsonMap) {
        searchResultListData.add(SearchResult.fromJson(searchResult));
      }

      return searchResultListData;
    } else {
      return [];
    }
  }

  Future<String> _loadAssetSampleData(String path) async {
    return rootBundle.loadString(path);
  }
}
