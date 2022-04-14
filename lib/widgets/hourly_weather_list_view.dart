import 'package:flutter/widgets.dart';

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
          decoration: const BoxDecoration(
            color: Color(0xFF4286E6),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child:  HourlyWeatherCard(
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
      itemCount: hourlyWeatherData.length, //TODO : Supply an identifier as an index
    );
  }
}
