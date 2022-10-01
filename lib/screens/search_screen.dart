import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/api/weather_api_service.dart';
import 'package:sunshine/provider/search_screen_state_manager.dart';

import '../models/models.dart';
import '../sunshine_theme/theme.dart';
import '../widgets/widgets.dart';

// ignore: must_be_immutable
class SearchLocationScreen extends StatefulWidget {
  SearchLocationScreen({Key? key}) : super(key: key);
  int itemsIndex = 7;

  @override
  _SearchLocationScreenState createState() => _SearchLocationScreenState();
}

// enum SearchScreenState { searchResults, savedLocations }

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  late TextEditingController _searchFieldController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final searchService = WeatherAPIService();

  // late SearchScreenState currentState;

  @override
  void initState() {
    _searchFieldController = TextEditingController();
    // currentState = SearchScreenState.savedLocations;
    super.initState();
  }

  @override
  void dispose() {
    _searchFieldController.dispose();
    print('Calling dispose() from search screen');
    // currentState = SearchScreenState.savedLocations;
    super.dispose();
  }

  String? _searchFieldValidator(String? searchFieldValue) {
    if (searchFieldValue == null || searchFieldValue.isEmpty) {
      return 'This field requires a value';
    } else {
      Provider.of<SearchScreenStateManager>(context, listen: false)
          .toggleScreenState(
        SearchScreenState.searchResults,
      );
      // setState(() {
      //   currentState = SearchScreenState.searchResults;
      // });
      return null;
    }
  }

  void _handleSearchFieldSubmit() {
    if (_formKey.currentState!.validate()) {
      //TODO: enum to handle switching between results and saved locations
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchScreenStateManager>(
        builder: (context, searchScreenStateManager, _) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.primaryColor,
          centerTitle: true,
          title: const Text('Pick Location'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: const BoxDecoration(
                color: Palette.primaryColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 5,
                          child: Form(
                            key: _formKey,
                            child: TextFormField(
                              validator: _searchFieldValidator,
                              controller: _searchFieldController,
                              onFieldSubmitted: (value) {
                                _handleSearchFieldSubmit();
                              },

                              style: const TextStyle(
                                color: Colors.white,
                              ),
                              // ignore: prefer_const_constructors
                              decoration: InputDecoration(
                                focusColor: Palette.highlightedTextColor,
                                hintText: 'Search',
                                // ignore: prefer_const_constructors
                                hintStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                prefixIcon: const Icon(
                                  Icons.search_rounded,
                                  color: Colors.white,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                ),
                                filled: true,

                                fillColor: Palette.searchBarColor,
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                              cursorColor: Colors.white,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: const Color(0xFF222249),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            // ignore: prefer_const_constructors
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: buildSearchScreenState(
                       searchScreenStateManager.state),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget buildSearchScreenState(SearchScreenState newScreenState) {
    if (newScreenState == SearchScreenState.savedLocations) {
      return buildSavedLocations();
    } else if (newScreenState == SearchScreenState.searchResults) {
      return buildSearchResult();
    } else {
      return const Center(
        child: Text('Error in rendering search screen state'),
      );
    }
  }

  Widget buildSavedLocations() {
    return GridView.builder(
        shrinkWrap: true,
        itemCount: widget.itemsIndex,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 25,
        ),
        itemBuilder: (context, index) {
          return const LocationWeatherCard();
        });
  }

  Widget buildSearchResult() {
    return FutureBuilder(
        future: searchService.getSearchResultData(_searchFieldController.text),
        builder: (context, AsyncSnapshot<List<SearchResult>> snapshot) {
          final searchResultData = snapshot.data;
          if (snapshot.hasError) {
            // currentState = SearchScreenState.savedLocations;
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (snapshot.hasData) {
            _searchFieldController.clear();
            // currentState = SearchScreenState.savedLocations;
            return SearchResultListView(searchResultData: searchResultData);
          } else {
            return const CircularProgressIndicator(
              color: Palette.activeCardColor,
            );
          }
        });
  }
}
//TODO: debug the saved locations render issue after navigating away from screen
