import 'package:intl/intl.dart';

class DailyWeatherModel {
  String shortDate;
  String day;
  double averageTemperature;
  // String dayWeatherIcon;

  DailyWeatherModel({
    required this.shortDate,
    required this.day,
    required this.averageTemperature,
    // required this.dayWeatherIcon, //TODO sort out icon loading
  });

  factory DailyWeatherModel.fromJson(Map<String, dynamic> json) {
    //TODO some date format computations

    final unixTime = json['date_epoch'] as int;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    final shortDateFormat = DateFormat.MMMd().format(dateTime);
    final dayFormat = DateFormat.d().format(dateTime);

    return DailyWeatherModel(
      shortDate: shortDateFormat,
      day: dayFormat,
      averageTemperature: json['avgtemp_c'] as double,
    );
  }
}
