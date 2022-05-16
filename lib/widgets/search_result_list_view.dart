import 'package:flutter/material.dart';

import '../models/search_result.dart';
import 'search_result_tile.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({
    Key? key,
    required this.searchResultData,
  }) : super(key: key);

  final List<SearchResult>? searchResultData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return SearchResultTile(
              searchName: searchResultData?[index].name ?? 'N/A',
              searchRegion: searchResultData?[index].region ?? 'N/A',
              searchCountry: searchResultData?[index].country ?? 'N/A');
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 25);
        },
        itemCount: searchResultData?.length ?? 5);
  }
}
