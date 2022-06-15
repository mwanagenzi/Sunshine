import 'package:flutter/material.dart';

class HourlyWeatherCard extends StatelessWidget {
  final String hour;
  final String weatherIconUrl;
  final double temperature;

  const HourlyWeatherCard({
    required this.weatherIconUrl,
    required this.hour,
    required this.temperature,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // ignore: prefer_const_constructors
        Image(
          height: 80,
          fit: BoxFit.fitWidth,
          image: NetworkImage(weatherIconUrl),
        ),
        // ignore: prefer_const_constructors

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(hour, style: Theme.of(context).textTheme.headline6),
            Text('$temperature\u2103',
                style: Theme.of(context).textTheme.headline3),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
