import 'package:flutter/material.dart';

class HourlyWeatherCard extends StatelessWidget {
  final String hour;
  final String weatherIconUrl;
  final double temperature;
  // String? iconUrl; //TODO implement an icon for every card
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
          width: 50,
          height: 50,
          image: NetworkImage(weatherIconUrl),
        ),
        // ignore: prefer_const_constructors
        SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Text(
              hour,
              // ignore: prefer_const_constructors
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12), //TODO text theme - caption
              // ignore: prefer_const_constructors
            ),
            // ignore: prefer_const_constructors
            Text(
              '$temperature\u2103',
              // ignore: prefer_const_constructors
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18), // TODO : text theme - headline6
            ),
          ],
        ),
        const SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
