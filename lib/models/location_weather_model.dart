class LocationWeatherInfo {
  String? currentTemperature;
  String? weatherElement;
  String? locationName;
  String? weatherIconUrl;

  LocationWeatherInfo({
    required this.currentTemperature,
    required this.weatherElement,
    required this.locationName,
    required this.weatherIconUrl,
  });

  factory LocationWeatherInfo.fromJson(Map<String, dynamic> json) {
    return LocationWeatherInfo(
      currentTemperature: json['current']['temp_c'] as String,
      weatherElement: json['current']['condition']['icon'] as String,
      locationName: json['location']['name'] as String,
      weatherIconUrl: json["current"]["temp_c"] as String,
    );
  }
}
