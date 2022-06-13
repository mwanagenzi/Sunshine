// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';
import 'package:sunshine/sunshine_theme/theme.dart';

import '../screens/location_screen.dart';

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
    return GestureDetector(
      onTap: () async {
        final searchLocationCoordinates = [this.latitude, this.longitude];
        print("Some coordinates for you to use : $searchLocationCoordinates");
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LocationScreen(
              searchLocationCoordinatesData: searchLocationCoordinates,
            ),
          ),
        );
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      searchName,
                      overflow: TextOverflow.clip,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    Text(
                      searchRegion,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.flag,
                  color: Colors.white,
                ),
                const SizedBox(width: 5),
                Text(
                  searchCountry,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            // ignore: prefer_const_constructors
          ],
        ),
      ),
    );
  }
}
//TODO: truncate the text from the search result to 15 characters before 
//TODO: before rendering them on this tile