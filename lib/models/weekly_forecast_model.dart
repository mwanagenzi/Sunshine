import 'package:sunshine/models/daily_forecast_model.dart';
import 'package:sunshine/models/hourly_weather_model.dart';

class WeeklyForecastData {
  final List<HourlyWeather> hourlyWeatherData;
  final List<DailyWeatherModel> dailyWeatherData;

  WeeklyForecastData(
    this.hourlyWeatherData,
    this.dailyWeatherData
  );
}
