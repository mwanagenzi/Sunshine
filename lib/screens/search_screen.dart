import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/provider/providers.dart';

import '../sunshine_theme/theme.dart';
import '../widgets/widgets.dart';

// ignore: must_be_immutable
class SearchLocationScreen extends StatefulWidget {
  SearchLocationScreen({Key? key}) : super(key: key);
  int itemsIndex = 7;

  @override
  _SearchLocationScreenState createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  late TextEditingController _searchFieldController;
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
                      Palette.primaryColor, //TODo : scaffold background color
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
                            child: TextFormField(
                              controller: _searchFieldController,
                              onFieldSubmitted: (value) => {
                                //TODO Insert autocomplete/search api function
                                //TODO : as well as a dropdown with available locations
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
                                fillColor: Palette
                                    .searchBarColor, //TODO : Add this to the theme settings
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                ),
                              ),
                              cursorColor: Colors.white,

                              //TODO: Validate input
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Container(
                              padding: const EdgeInsets.all(15),

                              decoration: BoxDecoration(
                                color: const Color(
                                    0xFF222249), //TODO : card background color
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
                      child: buildSavedLocations(),
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
}
