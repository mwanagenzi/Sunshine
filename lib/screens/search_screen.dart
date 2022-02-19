import 'package:flutter/material.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  _SearchLocationScreenState createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  @override
  Widget build(BuildContext context) {
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
            children: [
              Row(
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
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          // enabledBorder: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          //   borderSide: const BorderSide(
                          //     width: 1,
                          //     color: Colors.white,
                          //   ),
                          // ),
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
                        // color: const Color(0XFF080A33),
                        borderRadius: BorderRadius.circular(5),
                        // border: Border.all(width: 0.5, color: Colors.white),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration:  BoxDecoration(
                      color: const Color(0xFF4286E6),
                      borderRadius: BorderRadius.circular(15),
                      shape: BoxShape.rectangle
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  // Widget buildSavedLocations(){
  //   return GridView.count(crossAxisCount:,)
  // }
}
