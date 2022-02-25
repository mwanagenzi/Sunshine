import 'package:flutter/material.dart';

class HourlyWeatherCard extends StatelessWidget {
  const HourlyWeatherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        // ignore: prefer_const_constructors
        FlutterLogo(
          size: 50.0,
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
              '14:00',
              // ignore: prefer_const_constructors
              style: TextStyle(color: Colors.white, fontSize: 12), //TODO text theme - caption
              // ignore: prefer_const_constructors
            ),
            // ignore: prefer_const_constructors
            Text(
              '32\u2103',
              // ignore: prefer_const_constructors
              style: TextStyle(color: Colors.white, fontSize: 18),// TODO : text theme - headline6
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
