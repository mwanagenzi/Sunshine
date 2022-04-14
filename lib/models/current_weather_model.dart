class CurrentWeatherModel {
  String locationName;
  DateTime currentDate;
  //TODO Configure and set the date format
  //TODO Configure the image from its url
  double temperature;
  double windSpeed;
  int humidity;

  CurrentWeatherModel({
    required this.locationName,
    required this.currentDate,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    
    final unixTime = json['location']['localtime_epoch'] as int;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);

    return CurrentWeatherModel(
        locationName: json['location']['name'] as String,
        currentDate: dateTime,
        temperature: json['current']['temp_c'] as double,
        windSpeed: json['current']['wind_kph'] as double,
        humidity: json['current']['humidity'] as int);
  }
}
