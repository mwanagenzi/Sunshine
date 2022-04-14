import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/provider/navbar_tab_manager.dart';
import '../widgets/widgets.dart';

class WeeklyForecastScreen extends StatefulWidget {
  const WeeklyForecastScreen({Key? key}) : super(key: key);

  @override
  State<WeeklyForecastScreen> createState() => _WeeklyForecastScreenState();
}

class _WeeklyForecastScreenState extends State<WeeklyForecastScreen> {
  int todayForecastItems = 10;
  int weeklyForecastItems = 7;

  @override
  Widget build(BuildContext context) {
    return Consumer<NavbarTabManager>(
      builder: (context, navbarTabManager, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor:
                const Color(0XFF080A33), //TODO scaffold background color
            toolbarHeight: 100,
            centerTitle: true,
            // ignore: prefer_const_constructors
            title: Text('Forecast Report'),
          ),
          body: Container(
            color: const Color(0xFF080A33), //TODO primary color
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
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
                            ), //TODO textTheme headline6
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
                                fontSize: 12, //TODO textTheme - caption
                                color: Color(
                                    0xFF4286E8), //TODO textTheme - highlighted text color
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              decoration: const BoxDecoration(
                                color: Color(
                                    0xFF4286E6), //TODO highlighted card color
                                shape: BoxShape.rectangle,
                                // RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                // ),
                              ),
                              child: const HourlyWeatherCard(
                                hour: '',
                                temperature: 0,
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
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            'This week',
                            style: const TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20, //TODO textTheme - headline6
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
                    ),
                    Flexible(
                      flex: 6,
                      fit: FlexFit.tight,
                      child: ListView.separated(
                          itemBuilder: ((context, index) {
                            return const DailyForecastCard();
                          }),
                          separatorBuilder: (context, index) {
                            // ignore: prefer_const_constructors
                            return SizedBox(
                              height: 20,
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
      },
    );
  }
}
