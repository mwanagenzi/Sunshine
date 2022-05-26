import 'package:flutter/material.dart';
import 'package:sunshine/sunshine_theme/theme.dart';

class SearchResultTile extends StatelessWidget {
  final String searchName;
  final String searchRegion;
  final String searchCountry;

  const SearchResultTile(
      {required this.searchName,
      required this.searchRegion,
      required this.searchCountry,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
    );
  }
}
