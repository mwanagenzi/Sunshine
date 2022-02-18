import 'package:flutter/material.dart';

class WeeklyForecastScreen extends StatelessWidget {
  const WeeklyForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int forecastItems = 7;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFF080A33),
        toolbarHeight: 100,
        centerTitle: true,
        // ignore: prefer_const_constructors
        title: Text('Forecast Report'),
      ),
      body: Container(
        color: const Color(0xFF080A33),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_constructors
                  Text(
                    'Today',
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  // ignore: prefer_const_constructors
                  InkWell(
                    onTap: () {
                      //TODO : Open week forecast screen
                    },
                    // ignore: prefer_const_constructors
                    child: Text(
                      'View full report',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF4286E8),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF4286E6),
                          shape: BoxShape.rectangle,
                          // RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          // ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // ignore: prefer_const_constructors
                            FlutterLogo(
                              size: 50.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                // ignore: prefer_const_constructors
                                Text(
                                  '14:00',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                  // ignore: prefer_const_constructors
                                ),
                                // ignore: prefer_const_constructors
                                Text(
                                  '32\u2103',
                                  // ignore: prefer_const_constructors
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      // ignore: prefer_const_constructors
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: forecastItems),
              )
            ],
          ),
        ),
      ),
    );
  }
}
