class LocationWeatherInfo {
  String averageTemperature;
  String weatherElement;
  String locationName;
  String weatherIconUrl;

  LocationWeatherInfo({
    required this.averageTemperature,
    required this.weatherElement,
    required this.locationName,
    required this.weatherIconUrl,
  });

  factory LocationWeatherInfo.fromJson(Map<String, dynamic> json) {
    return LocationWeatherInfo(
      averageTemperature: json['averageTemperature'] as String,
      weatherElement: json['weatherElement'] as String,
      locationName: json['locationName'] as String,
      weatherIconUrl: json['locationWeatherUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'averageTemperature': averageTemperature,
      'weatherElement': weatherElement,
      'locationName': locationName,
      'weatherIconUrl': weatherIconUrl
    };
  }
}
