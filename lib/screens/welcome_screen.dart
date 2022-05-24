import 'package:flutter/material.dart';
import 'package:sunshine/utils/constants.dart';

import '../widgets/sunshine_auth_button.dart';
import '../widgets/widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AuthScreenSvg(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          'Hi!',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(height: 20),
                      SunshineAuthButton(
                        buttonText: 'Register',
                        buttonFunction: () {
                          Navigator.pushNamed(context, AppRoutes.signUp);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SunshineAuthButton(
                        buttonText: 'Login',
                        buttonFunction: () {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
