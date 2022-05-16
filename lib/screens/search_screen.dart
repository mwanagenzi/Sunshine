import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/api/mock_weather_service.dart';
import 'package:sunshine/provider/providers.dart';

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

enum SearchScreenState { searchResults, savedLocations }

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  late TextEditingController _searchFieldController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final searchService = MockWeatherService();
  SearchScreenState currentState = SearchScreenState.savedLocations;

  @override
  void initState() {
    _searchFieldController = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    _searchFieldController.dispose();
    super.deactivate();
  }

  String? _searchFieldValidator(String? searchFieldValue) {
    if (searchFieldValue == null || searchFieldValue.isEmpty) {
      return 'This field requires a value';
    } else {
      setState(() {
        currentState = SearchScreenState.searchResults;
      });
      return null;
    }
  }

  void _handleSearchFieldSubmit() {
    if (_formKey.currentState!.validate()) {
      //TODO: call the network service to handle search
      //TODO: display the result
      //TODO: enum to handle switching between results and saved locations
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarTabManager>(
      builder: (context, navbarTabManager, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:
                Palette.primaryColor, //TODO : appbar background color

            centerTitle: true,
            // ignore: prefer_const_constructors
            title: Text('Pick Location'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: const BoxDecoration(
                  color:
                      Palette.primaryColor, //TODO : scaffold background color
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
                                onFieldSubmitted: (value) { _handleSearchFieldSubmit();
                                buildSearchResult(value);},

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
                      child: currentScreenState == SearchScreenState.savedLocations? buildSavedLocations():buildSearchResult(value);
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
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

  Widget buildSearchResult(String value){
    return FutureBuilder(
                                    //TODO: on handle submit to return widget and validate input
                                    future: searchService.getSearchResultData(),
                                    builder: (context,
                                        AsyncSnapshot<List<SearchResult>>
                                            snapshot) {
                                      final searchResultData = snapshot.data;

                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        return SearchResultListView(
                                            searchResultData: searchResultData);
                                      } else {
                                        return const CircularProgressIndicator(
                                          color: Palette.activeCardColor,
                                        );
                                      }
                                    });
  }

  
}
