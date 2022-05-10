import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/home.dart';
import 'package:sunshine/provider/providers.dart';
import 'package:sunshine/screens/screens.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import 'package:sunshine/sunshine_theme/theme.dart';
import 'package:sunshine/widgets/auth_screen_svg.dart';

import '../widgets/sunshine_auth_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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

  String? _fieldValidator(String? passFieldValue) {
    if (passFieldValue == null || passFieldValue.isEmpty) {
      return 'This field must contain a value';
    } else if (passFieldValue.length <= 8) {
      return 'Password must contain more than 8 characters';
    } else {
      return null;
    }
  }

  void _handleSubmit(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      //TODO; Check if user exists
      //TODO: If new,register user to firebase
      //TODO: If user exists,=> error message,=> route to login screen
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider(
            create: (context) => NavbarTabManager(),
            child: const Home(),
          ),
        ),
      );
    }
  }

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
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _passwordController,
                          cursorColor: Colors.black,
                          autofocus: true,
                          obscureText: isTextObscured,
                          validator: _fieldValidator,
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
                      ),
                      const SizedBox(height: 20),
                      SunshineAuthButton(
                        buttonText: 'Continue',
                        buttonFunction: () {
                          _handleSubmit(context);
                          //TODO: authenticate the user with firebase
                          //TODO : then navigate to the home screen
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
