import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import 'package:sunshine/sunshine_theme/theme.dart';

import '../widgets/sunshine_auth_button.dart';

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
      body: SingleChildScrollView(
        child: SafeArea(
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  'assets/images/curve_top.svg',
                  color: Palette.activeCardColor,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Expanded(
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
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          cursorColor: Colors.black,
                          autofocus: true,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.email_outlined,
                              color: Colors.black,
                            ),
                            focusColor: Palette.highlightedTextColor,
                            hintText: 'Email Address',
                            // ignore: prefer_const_constructors
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SunshineAuthButton(
                          buttonText: 'Continue',
                          buttonFunction: () {
                            //TODO: check whether user exists or not
                            //TODO:navigate to relevant screen (login or register)
                          },
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Text('or',
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.white,
                          leading: const Icon(
                            Icons.facebook_rounded,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Continue with Facebook',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                          onTap: () {
                            //TODO Open Facebook account api
                          },
                        ),
                        const SizedBox(height: 20),
                        ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          tileColor: Colors.white,
                          leading: const Icon(
                            Icons.search_outlined,
                            color: Colors.black,
                          ),
                          title: Text(
                            'Continue with Google',
                            style:
                                Theme.of(context).textTheme.bodyText2!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                          onTap: () {
                            //TODO Open Google account api
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const Text("Don't have an account?"),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                //TODO navigate to the registration page
                              },
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Palette.highlightedTextColor),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: () {
                            //TODO: password reset functionality
                          },
                          child: Text(
                            'Forgot your password?',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Palette.highlightedTextColor),
                            //
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
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
