import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import 'package:sunshine/sunshine_theme/theme.dart';

import '../widgets/sunshine_auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _passwordController;
  @override
  void initState() {
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    _passwordController.dispose();
    super.deactivate();
  }

  bool isTextObscured = true;
  IconData visibilityIcon = Icons.visibility_off;

  IconData _changePasswordSuffixIcon(IconData visibleIcon) {
    if (visibleIcon == Icons.visibility) {
      return visibleIcon = Icons.visibility_off;
    } else {
      return visibleIcon = Icons.visibility;
    }
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
                            'Login',
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2),
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          controller: _passwordController,
                          cursorColor: Colors.black,
                          autofocus: true,
                          obscureText: isTextObscured,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.black),
                            focusColor: Palette.highlightedTextColor,
                            hintText: 'Password',
                            // ignore: prefer_const_constructors
                            hintStyle: TextStyle(
                              color: Colors.black,
                            ),
                            prefixIcon: const Icon(
                              Icons.password_rounded,
                              color: Colors.black,
                            ),
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTextObscured = !isTextObscured;
                                  visibilityIcon =
                                      _changePasswordSuffixIcon(visibilityIcon);
                                });
                                // _changePasswordSuffixIcon(visibilityIcon);
                              },
                              child: Icon(
                                visibilityIcon,
                                color: Colors.black,
                              ),
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
                            //TODO: authenticate the user with firebase
                          },
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
