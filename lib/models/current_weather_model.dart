import 'package:sunshine/services/location_service.dart';
import 'package:sunshine/services/network_helper.dart';
import 'package:sunshine/utils/constants.dart';

const String kCurrentWeatherApiMethod = '/current.json';
LocationService cLocationService = LocationService();

class CurrentWeatherModel {
   int? windSpeed;
   int? humidity;
   double? currentTemperature;

  CurrentWeatherModel({
     this.windSpeed,
     this.humidity,
     this.currentTemperature,
  });

  Future fetchCurrentWeatherData() async {
    final List<double>? currentCoordinates =
        await cLocationService.getCurrentLocationCoordinates();

    final weatherData = await NetworkHelper(
            apiUrl:
                "$kWeatherApiUrl$kCurrentWeatherApiMethod?key=$kApiKey&q=${currentCoordinates![0]},${currentCoordinates[1]}")
        .getData();
    return weatherData;
  }

  

  // factory CurrentWeatherModel.weatherDetails(Map<String, dynamic> weatherData) {
  //   return CurrentWeatherModel(
  //       windSpeed: weatherData['current']['wind_kph'] ?? 0,
  //       humidity: weatherData['current']['humidity'] ?? 0,
  //       currentTemperature: weatherData['current']['temp_c'] ?? 0);
  // }
}
