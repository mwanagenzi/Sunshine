import 'package:flutter/material.dart';

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
      title: Text('Name : $searchName '),
      subtitle: Text('Region : $searchRegion'),
      trailing: Text('Country : $searchCountry'),
    );
  }
}
