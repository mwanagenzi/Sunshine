import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sunshine/models/models.dart';
import 'package:sunshine/models/weekly_forecast_model.dart';
import 'package:sunshine/services/location_service.dart';
import 'package:sunshine/services/network_helper.dart';
import 'package:sunshine/utils/constants.dart';

class WeatherAPIService {
  late final NetworkHelperService _networkHelperService;
  late final LocationService _locationService;

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
    List<double>? locationCoordinates =
        await _locationService.getCurrentLocationCoordinates();
    _networkHelperService = NetworkHelperService(
        apiUrl:
            "{$kWeatherApiUrl$kCurrentWeatherApiMethod}key={$kApiKey}&q=${locationCoordinates?[0]},${locationCoordinates?[1]}&aqi=no");
    var currentWeatherData = await _networkHelperService.getData();

    final Map<String, dynamic> jsonMap = jsonDecode(currentWeatherData);
    print("Real-time weather data from json API : $jsonMap");

    if (jsonMap['location']['name'].toString().isNotEmpty) {
      final currentWeatherData = CurrentWeatherModel.fromJson(jsonMap);
      return currentWeatherData;
    } else {
      return CurrentWeatherModel(
          locationName: 'unavailable',
          currentDate: DateFormat.yMEd().format(DateTime.now()),
          temperature: 0,
          imageUrl: '',
          windSpeed: 0,
          humidity: 0);
    }
  }

  Future<List<HourlyWeather>> _getHourlyWeatherData() async {
    List<double>? locationCoordinates =
        await _locationService.getCurrentLocationCoordinates();

    _networkHelperService = NetworkHelperService(
        apiUrl:
            "{$kWeatherApiUrl$kForecastApiMethod}key={$kApiKey}&q=${locationCoordinates?[0]},${locationCoordinates?[1]}&days=3&aqi=no&alerts=no");

    final hourlyWeatherDataString = await _networkHelperService.getData();

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
