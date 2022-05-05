import 'package:flutter/material.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import 'package:sunshine/sunshine_theme/theme.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late TextEditingController _emailController;
  @override
  void initState() {
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    _emailController.dispose();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.primaryColor,
      //TODO : insert a global map-like background image (png, then later svg)
      body: Center(
          child: Column(
        children: [
          const Text(
            'Hi!',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            decoration: BoxDecoration(
              color: Palette.primaryColor.withOpacity(0.7),
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
