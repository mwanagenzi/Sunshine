// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:sunshine/sunshine_theme/theme.dart';
import 'package:sunshine/utils/constants.dart';

class SearchResultTile extends StatelessWidget {
  final String searchName;
  final String searchRegion;
  final String searchCountry;
  final double latitude;
  final double longitude;

  const SearchResultTile(
      {required this.searchName,
      required this.searchRegion,
      required this.searchCountry,
      required this.latitude,
      required this.longitude,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () async {
          final searchLocationCoordinates = [this.latitude, this.longitude];
          Navigator.popAndPushNamed(context, AppRoutes.location);

          //TODO: capture the location coordinates
          //TODO: Launch geolocation service
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1.0,
              color: Palette.activeCardColor,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location : $searchName ',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Text(
                    'Region : $searchRegion ',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              Text(
                'Country : $searchCountry ',
                style: Theme.of(context).textTheme.bodyText2,
              ),
              // ignore: prefer_const_constructors
            ],
          ),
        ),
      ),
    );
  }
}
