import 'current_weather_model.dart';
import 'hourly_weather_model.dart';

class SearchLocationWeatherData {
  final List<HourlyWeather> hourlyWeatherData;
  final CurrentWeatherModel currentWeatherData;

  SearchLocationWeatherData({
    required this.currentWeatherData,
    required this.hourlyWeatherData
  });
}
