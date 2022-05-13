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
    return ListTile(
      onTap: (() {
        //TODO; Open current weaher screen with relevant weather data
      }),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Palette.activeCardColor,
        ),
      ),
      title: Text('Name : $searchName '),
      subtitle: Text('Region : $searchRegion'),
      trailing: Text('Country : $searchCountry'),
    );
  }
}
