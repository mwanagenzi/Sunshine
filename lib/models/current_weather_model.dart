import 'package:intl/intl.dart';

class CurrentWeatherModel {
  String locationName;
  String currentDate;
  //TODO Configure and set the date format
  //TODO Configure the image from its url
  String imageUrl;
  double temperature;
  double windSpeed;
  int humidity;

  CurrentWeatherModel({
    required this.locationName,
    required this.currentDate,
    required this.imageUrl,
    required this.temperature,
  
    required this.windSpeed,
    required this.humidity,
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    final unixTime = json['location']['localtime_epoch'] as int;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    final dateFormat = DateFormat.yMEd().format(dateTime);

    return CurrentWeatherModel(
        locationName: json['location']['name'] as String,
        currentDate: dateFormat,
        temperature: json['current']['temp_c'] as double,
        imageUrl: json['current']['condition']['icon'] as String,
        windSpeed: json['current']['wind_kph'] as double,
        humidity: json['current']['humidity'] as int);
  }
}
