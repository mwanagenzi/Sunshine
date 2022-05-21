import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/screens/login_screen.dart';
import 'package:sunshine/sunshine_theme/palette.dart';
import 'package:sunshine/sunshine_theme/theme.dart';
import 'package:sunshine/utils/constants.dart';

import '../widgets/sunshine_auth_button.dart';
import '../widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _emailController, _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void deactivate() {
    _emailController.dispose();
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

  String? _fieldValidator(String? textFieldValue) {
    if (textFieldValue == null || textFieldValue.isEmpty) {
      return 'This value is required';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(textFieldValue)) {
      textFieldValue.toLowerCase();
      return 'Enter a valid email address';
    } else {
      textFieldValue.toLowerCase();
      return null;
    }
  }

  void _handleSubmit(BuildContext context) async {
    SnackBar _showSnackBarMessage(String errorMessage) {
      return SnackBar(content: Text(errorMessage));
    }

    if (_formKey.currentState!.validate()) {
      try {
        final credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        ScaffoldMessenger.of(context).showSnackBar(_showSnackBarMessage(
            "${credential.user?.displayName} You've signed up successfully"));

        Navigator.popAndPushNamed(context, AppRoutes.login);
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');

          ScaffoldMessenger.of(context).showSnackBar(
              _showSnackBarMessage("The password provided is too weak."));
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');

          ScaffoldMessenger.of(context).showSnackBar(_showSnackBarMessage(
              "The account already exists for that email."));
        }
      } catch (e) {
        print(e);
      }
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Text(
                          'Sign up',
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _emailController,
                          cursorColor: Colors.black,
                          autofocus: true,
                          keyboardType: TextInputType.name,
                          validator: _fieldValidator,
                          decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(color: Colors.black),
                              focusColor: Palette.highlightedTextColor,
                              hintText: 'Email Address',
                              // ignore: prefer_const_constructors
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              prefixIcon: const Icon(
                                Icons.account_circle_outlined,
                                color: Colors.black,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                        buttonText: 'Sign up',
                        buttonFunction: () {
                          _handleSubmit(context);
                        },
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Text("Already have an account?"),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              //TODO navigate to the login screen
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Palette.highlightedTextColor),
                            ),
                          ),
                        ],
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
