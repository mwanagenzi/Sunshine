import 'package:flutter/widgets.dart';
import 'package:sunshine/sunshine_theme/theme.dart';

import '../models/hourly_weather_model.dart';
import 'widgets.dart';

class HourlyWeatherListView extends StatelessWidget {
  final List<HourlyWeather> hourlyWeatherData;
  const HourlyWeatherListView({Key? key, required this.hourlyWeatherData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Palette.inactiveCardColor,
            // shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(color: Palette.activeCardColor, width: 1.0),
          ),
          child: HourlyWeatherCard(
            weatherIconUrl: hourlyWeatherData[index].weatherIconUrl,
            hour: hourlyWeatherData[index].time,
            temperature: hourlyWeatherData[index].temperature,
          ),
        );
      },
      separatorBuilder: (context, index) {
        // ignore: prefer_const_constructors
        return SizedBox(
          width: 10,
        );
      },
      itemCount: hourlyWeatherData.length,
    );
  }
}
