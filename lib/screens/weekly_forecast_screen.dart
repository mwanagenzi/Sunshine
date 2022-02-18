import 'package:flutter/material.dart';

class WeeklyForecastScreen extends StatelessWidget {
  const WeeklyForecastScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int todayForecastItems = 10;
    int weeklyForecastItems = 7;
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
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
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
                        '${DateTime.now()}', //TODO : Format this date to match design
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
                      itemCount: todayForecastItems),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    // ignore: prefer_const_constructors
                    Text(
                      'This week',
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),

                    // ignore: prefer_const_constructors
                    Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                    ),
                  ],
                ),
                Flexible(
                  child: ListView.separated(
                      itemBuilder: ((context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0XFF080A33),
                            border: Border.all(
                              width: 1.0,
                              color: const Color(0xFF4286E6),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const Text(
                                    'Temp',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Text(
                                    '32\u2103',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                '32\u2103',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                ),
                              ),
                              // ignore: prefer_const_constructors
                              FlutterLogo(
                                size: 40,
                              )
                            ],
                          ),
                        );
                      }),
                      separatorBuilder: (context, index) {
                        // ignore: prefer_const_constructors
                        return SizedBox(
                          height: 10,
                        );
                      },
                      itemCount: weeklyForecastItems),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
