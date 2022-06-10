import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sunshine/models/models.dart';
import 'package:sunshine/models/weekly_forecast_model.dart';
import 'package:sunshine/services/location_service.dart';
import 'package:sunshine/services/network_helper.dart';
import 'package:sunshine/utils/constants.dart';

class WeatherAPIService {
  late final NetworkHelperService _currentWeatherNetworkHelperService,
      _hourlyWeatherNetworkHelperService,
      _dailyForecastNetworkHelperService;
  final LocationService _locationService = LocationService();

  Future<DailyWeatherData> getDailyWeatherData() async {
    print("from getDailyWeather()");
    await _locationService.checkLocationPermission();
    final currentWeather = await _getCurrentWeatherData();
    final hourlyWeatherConditions = await _getHourlyWeatherData();
    return DailyWeatherData(currentWeather, hourlyWeatherConditions);
  }

  Future<WeeklyForecastData> getWeeklyWeatherData() async {
    final hourlyWeatherData = await _getHourlyWeatherData();
    final dailyForecastData = await _getDailyForecastData();

    return WeeklyForecastData(hourlyWeatherData, dailyForecastData);
  }

  Future<SearchLocationWeatherData> getSearchLocationWeatherData(
      List<double> locationCoordinates) async {
    final currentSearchLocationWeatherData =
        await _getCurrentSearchLocationWeatherData(locationCoordinates);
    final searchLocationHourlyWeatherData =
        await _getsearchLocationHourlyWeatherConditions(locationCoordinates);
    return SearchLocationWeatherData(
        currentWeatherData: currentSearchLocationWeatherData,
        hourlyWeatherData: searchLocationHourlyWeatherData);
  }

  Future<CurrentWeatherModel> _getCurrentSearchLocationWeatherData(
      List<double> coordinates) async {
    print("from _getCurrentSearchLocationWeatherData()");
    _currentWeatherNetworkHelperService = NetworkHelperService(
        apiUrl:
            "$kWeatherApiUrl$kCurrentWeatherApiMethod?key=$kApiKey&q=${coordinates[0]},${coordinates[1]}&aqi=no");

    final Map<String, dynamic> jsonMap =
        await _currentWeatherNetworkHelperService.getData();

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

  Future<List<HourlyWeather>> _getsearchLocationHourlyWeatherConditions(
      List<double> coordinates) async {
    print("from _getsearchLocationHourlyWeatherConditions()");
    _hourlyWeatherNetworkHelperService = NetworkHelperService(
        apiUrl:
            "$kWeatherApiUrl$kForecastApiMethod?key=$kApiKey&q=${coordinates[0]},${coordinates[1]}&days=3&aqi=no&alerts=no");

    final Map<String, dynamic> jsonMap =
        await _hourlyWeatherNetworkHelperService.getData();

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

  Future<CurrentWeatherModel> _getCurrentWeatherData() async {
    print("from _getCurrentWeatherData()");

    List<double>? locationCoordinates =
        await _locationService.getCurrentLocationCoordinates();
    _currentWeatherNetworkHelperService = NetworkHelperService(
        apiUrl:
            "$kWeatherApiUrl$kCurrentWeatherApiMethod?key=$kApiKey&q=${locationCoordinates?[0]},${locationCoordinates?[1]}&aqi=no");

    final Map<String, dynamic> jsonMap =
        await _currentWeatherNetworkHelperService.getData();

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

    _hourlyWeatherNetworkHelperService = NetworkHelperService(
        apiUrl:
            "$kWeatherApiUrl$kForecastApiMethod?key=$kApiKey&q=${locationCoordinates?[0]},${locationCoordinates?[1]}&days=3&aqi=no&alerts=no");

    final Map<String, dynamic> jsonMap =
        await _hourlyWeatherNetworkHelperService.getData();

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
    List<double>? locationCoordinates =
        await _locationService.getCurrentLocationCoordinates();
    _dailyForecastNetworkHelperService = NetworkHelperService(
        apiUrl:
            "$kWeatherApiUrl$kForecastApiMethod?key=$kApiKey&q=${locationCoordinates?[0]},${locationCoordinates?[1]}&days=3&aqi=no&alerts=no");

    final Map<String, dynamic> jsonMap =
        await _dailyForecastNetworkHelperService.getData();

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
    //TODO; Tis fetches data based on the keyword in the search box
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
