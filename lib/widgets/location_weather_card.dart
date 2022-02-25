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
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
          color: Palette.activeCardColor,// TODO : highlighted button text color
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
    
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
    
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    '32\u2103',
                    // ignore: unnecessary_const
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22, //TODO textTheme headline5
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cloudy',
                    // ignore: unnecessary_const
                    style: const TextStyle(
                      fontSize: 12, //TODO : textTheme caption
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                width: 15,
              ),
              // ignore: prefer_const_constructors
              FlutterLogo(
                size: 35,
              ),
            ],
          ),
          // ignore: prefer_const_constructors
          SizedBox(height: 20),
          const Text(
            'Carlifornia',
            // ignore: unnecessary_const
            style: const TextStyle(
              fontSize: 15, //TODO : textTheme body1
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
