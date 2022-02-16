// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final int index = 3;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Forecast'),
      ),
      body: SafeArea(
        child: Container(
          color: Colors.blue.shade900,
          //Reference sunshine_app.jpg
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      // TODO : display forecast screen
                    },
                    child: const Text('Forecast'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      //TODO display air quality
                    },
                    child: const Text('Air quality'),
                  ),
                ],
              ),
              // ignore: prefer_const_constructors
              FlutterLogo(
                size: 100,
              ), // TODO : weather icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Temp'),
                      const Text('32\u2103'),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Wind'),
                      const Text('10 km/h '),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Humidity'),
                      const Text('75%'),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // ignore: prefer_const_literals_to_create_immutables
                children: [const Text('Today'), const Text('View full report')],
              ),
              ListView.builder(
                itemCount: index,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                
                return Container(
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const FlutterLogo(
                        size: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [const Text('14:00'), const Text('32\u2103')],
                      )
                    ],
                  ),
                );
              })
            ],
          ),
          //TODO Define bottom navbar
          //TODO : Create weather icon
          //TODO : Temperature text widget
          //TODO: Weather condition text widget
          //TODO: Current date widget
          //TODO: Row for weather elements, wind, humidity, cloud cover
        ),
      ),
    );
  }
}
