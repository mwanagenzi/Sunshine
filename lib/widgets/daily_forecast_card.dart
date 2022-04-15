import 'package:flutter/material.dart';

class DailyForecastCard extends StatelessWidget {
  String dayOfWeek;
  String date;
  double averageTemp;

  DailyForecastCard({
    Key? key,
    required this.dayOfWeek,
    required this.date,
    required this.averageTemp,
  }) : super(key: key);

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
              Text(
                dayOfWeek ,
                style: const TextStyle(
                  fontSize: 20, //TODO : text theme headline6
                  color: Colors.white,
                ),
              ),
               Text(
                date,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12, //TODO : texttheme caption
                ),
              ),
            ],
          ),
           Text(
            '$averageTemp\u2103',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30, //TODO : texttheme headline 4
            ),
          ),
          // ignore: prefer_const_constructors
          FlutterLogo(
            size: 40,
          )
        ],
      ),
    );
  }
}
