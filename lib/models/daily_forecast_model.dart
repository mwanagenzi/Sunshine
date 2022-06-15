import 'package:intl/intl.dart';

class DailyWeatherModel {
  String shortDate;
  String day;
  double averageTemperature;
  String weatherIconUrl;

  DailyWeatherModel(
      {required this.shortDate,
      required this.day,
      required this.averageTemperature,
      required this.weatherIconUrl});

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    final unixTime = json['date_epoch'] as int;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    final shortDateFormat = DateFormat.MMMd().format(dateTime);
    final dayFormat = DateFormat.EEEE().format(dateTime);

    final apiImageUrl = json['day']['condition']['icon'] ?? '';
    String appendedImageUrl = ('https:$apiImageUrl');

    return DailyWeatherModel(
        shortDate: shortDateFormat,
        day: dayFormat,
        averageTemperature: json['day']['avgtemp_c'] as double,
        weatherIconUrl: appendedImageUrl);
  }
}
