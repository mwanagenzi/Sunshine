import 'package:flutter/material.dart';
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
      backgroundColor: Palette.primaryColor,
      //TODO : insert a global map-like background image (png, then later svg)
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Flexible(
              flex: 1,
              child: SizedBox(
                height: 10,
              ),
            ),
            const Flexible(
              flex: 1,
              child: Text(
                'Hi!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 3,
              child: Container(
                // height: MediaQuery.of(context).size.height * 0.25,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Palette.searchBarColor.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      cursorColor: Colors.black,
                      autofocus: true,
                      decoration: InputDecoration(
                        focusColor: Palette.highlightedTextColor,
                        hintText: 'Email Address',
                        // ignore: prefer_const_constructors
                        hintStyle: TextStyle(
                          color: Colors.black,
                        ),
                        prefixIcon: const Icon(
                          Icons.search_rounded,
                          color: Colors.white,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        fillColor: Colors
                            .white, //TODO : Add this to the theme settings

                        // const InputDecoration(
                        //   hintText: 'Email address',
                        //   icon: Icon(Icons.email_outlined),
                        //   // errorText: 'Enter correct email address',
                        //   focusedBorder: OutlineInputBorder(
                        //     borderSide:
                        //         BorderSide(color: Palette.highlightedTextColor),
                        //   ),
                        //   disabledBorder: OutlineInputBorder(
                        //     borderSide: BorderSide(color: Palette.inactiveCardColor),
                        //   ),
                        // ),
                      ),
                    ),
                    SunshineAuthButton(
                      buttonText: 'Continue',
                      buttonFunction: () {
                        //TODO: check whether user exists or not
                        //TODO:navigate to relevant screen (login or register)
                      },
                    ),
                    Text('or', style: Theme.of(context).textTheme.bodyText2),
                    ListTile(
                      tileColor: Colors.white,
                      leading: const Icon(Icons.facebook_rounded),
                      title: const Text('Continue with Facebook'),
                      onTap: () {
                        //TODO Open Facebook account api
                      },
                    ),
                    ListTile(
                      tileColor: Colors.white,
                      leading: const Icon(Icons.search_outlined),
                      title: const Text('Continue with Google'),
                      onTap: () {
                        //TODO Open Facebook account api
                      },
                    ),
                    // GestureDetector(
                    //   onTap: () {
                    //     //TODO Open google accounts API
                    //   },
                    //   child: Card(
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(10),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: const [
                    //         Icon(Icons.search_outlined),
                    //         Text(
                    //           'Continue with Google',
                    //           style: TextStyle(color: Colors.black),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Row(
                      children: [
                        const Text("Don't have an account?"),
                        InkWell(
                          onTap: () {
                            //TODO navigate to the registration page
                          },
                          highlightColor: Palette.highlightedTextColor,
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        //TODO: password reset functionality
                      },
                      highlightColor: Palette.highlightedTextColor,
                      child: const Text('Forgot your password'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable

