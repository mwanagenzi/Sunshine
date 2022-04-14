class HourlyWeather {
  String weatherIconUrl;
  DateTime time;
  String temperature;

  HourlyWeather({
    required this.weatherIconUrl,
    required this.time,
    required this.temperature,
  });

  factory HourlyWeather.fromJson(Map<String, dynamic> json) {
    final unixTime =
        json['forecast']['forecastday'][0]['hour'][0]['time_epoch'] as int;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(unixTime * 1000);
    //TODO find out how to create a unique time for each hourly card

    return HourlyWeather(
        weatherIconUrl: json['forecast']['forecastday'][0]['hour'][3]
            ['condition']['icon'],
        time: dateTime,
        temperature: json['forecast']['forecastday'][0]['hour'][3]['temp_c']);
  }
}
