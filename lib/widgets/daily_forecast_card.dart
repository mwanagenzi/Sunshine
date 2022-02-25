import 'package:flutter/material.dart';

class DailyForecastCard extends StatelessWidget {
  const DailyForecastCard({
    Key? key,
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
              const Text(
                'Temp',
                style: TextStyle(
                  fontSize: 20, //TODO : text theme headline6
                  color: Colors.white,
                ),
              ),
              const Text(
                '32\u2103',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12, //TODO : texttheme caption
                ),
              ),
            ],
          ),
          const Text(
            '32\u2103',
            style: TextStyle(
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
