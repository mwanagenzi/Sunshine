import 'package:flutter/material.dart';

import '../sunshine_theme/theme.dart';

// ignore: must_be_immutable
class SunshineAuthButton extends StatelessWidget {
  String buttonText;
  void Function() buttonFunction;
  SunshineAuthButton({
    required this.buttonText,
    required this.buttonFunction,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: buttonFunction,
        child: Text(buttonText),
        style: TextButton.styleFrom(
            onSurface: Palette.highlightedTextColor,
            textStyle: const TextStyle(
              color: Colors.white,
            )));
  }
}
