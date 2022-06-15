import 'package:flutter/material.dart';

class DailyForecastCard extends StatelessWidget {
  final String dayOfWeek;
  final String date;
  final double averageTemp;
  final String weatherIconUrl;

  const DailyForecastCard(
      {Key? key,
      required this.dayOfWeek,
      required this.date,
      required this.averageTemp,
      required this.weatherIconUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFF080A33),
        border: Border.all(
          width: 1.0,
          color: const Color(0xFF4286E6),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(dayOfWeek, style: Theme.of(context).textTheme.headline2),
              Text(date, style: Theme.of(context).textTheme.headline6),
            ],
          ),
          Text('$averageTemp\u2103',
              style: Theme.of(context).textTheme.headline1),
          Image(
            width: 40,
            fit: BoxFit.fitHeight,
            image: NetworkImage(weatherIconUrl),
          ),
        ],
      ),
    );
  }
}
