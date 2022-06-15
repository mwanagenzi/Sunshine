import 'package:flutter/material.dart';
import 'package:sunshine/sunshine_theme/theme.dart';

class LocationWeatherCard extends StatelessWidget {
  const LocationWeatherCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
      ),
      decoration: BoxDecoration(
          color: Palette.activeCardColor,
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text('32\u2103',
                      style: Theme.of(context).textTheme.headline5),
                  const SizedBox(height: 10),
                  Text('Cloudy', style: Theme.of(context).textTheme.headline4),
                ],
              ),
              const SizedBox(
                width: 15,
              ),
              const FlutterLogo(
                size: 35,
              ),
            ],
          ),
          Text('Carlifornia',
              // ignore: unnecessary_const
              style: Theme.of(context).textTheme.labelMedium),
        ],
      ),
    );
  }
}
