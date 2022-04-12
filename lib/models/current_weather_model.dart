class CurrentWeatherModel {
  String locationName;
  //TODO Configure and set the date format
  //TODO Configure the image from its url
  double temperature;
  double windSpeed;
  int humidity;

  CurrentWeatherModel({
    required this.locationName,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    final jLocation = json['location'] as String;
    final jTemperature = json['current']['temp_c'] as double;
    final jWindspeed = json['current']['wind_kph'] as double;
    final jHumidity = json['current']['humidity'];
    return CurrentWeatherModel(
        locationName: jLocation,
        temperature: jTemperature,
        windSpeed: jWindspeed,
        humidity: jHumidity);
  }
}
