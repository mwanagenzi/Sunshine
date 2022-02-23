import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/provider/providers.dart';

import '../widgets/widgets.dart';

// ignore: must_be_immutable
class SearchLocationScreen extends StatefulWidget {
  SearchLocationScreen({Key? key}) : super(key: key);
  int itemsIndex = 7;

  @override
  _SearchLocationScreenState createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarTabManager>(
      builder: (context, navbarTabManager, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF080A33),
            toolbarHeight: 100,
            centerTitle: true,
            // ignore: prefer_const_constructors
            title: Text('Pick Location'),
          ),
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFF080A33),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Flexible(
                          flex: 5,
                          child: TextFormField(
                            // ignore: prefer_const_constructors
                            decoration: InputDecoration(
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
                                fillColor: const Color(
                                    0xFF222249), //TODO : Add this to the theme settings
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                )),
                            cursorColor: Colors.white,
                            //TODO: Validate input
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
                    flex: 4,
                    child: buildSavedLocations(),
                  )
                ],
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
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return const LocationWeatherCard();
        });
  }
}
