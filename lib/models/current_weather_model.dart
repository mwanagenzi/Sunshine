import 'package:sunshine/services/location_service.dart';
import 'package:sunshine/utils/constants.dart';

const String kCurrentWeatherApiMethod = '/current.json';
LocationService cLocationService = LocationService();

class CurrentWeatherModel {
  final int windSpeed;
  final int humidity;
  final int currentTemperature;

  CurrentWeatherModel({
    required this.windSpeed,
    required this.humidity,
    required this.currentTemperature,
  });

  Future getCurrentWeatherData() async {
    final List<double> currentCoordinates =
        await cLocationService.getCurrentLocationCoordinates();

    final String currentWeatherUrl =
        "$kWeatherApiUrl$kCurrentWeatherApiMethod?key=$kApiKey&q=${cLocationService.getCurrentLocationCoordinates()}";
  }
}
