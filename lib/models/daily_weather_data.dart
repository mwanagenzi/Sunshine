import 'package:sunshine/models/current_weather_model.dart';
import 'package:sunshine/models/hourly_weather_model.dart';

class DailyWeatherData {
  final List<HourlyWeather> hourlyWeatherData;
  final CurrentWeatherModel currentWeatherData;

  DailyWeatherData(this.currentWeatherData, this.hourlyWeatherData);
}
