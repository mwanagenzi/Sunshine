import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../sunshine_theme/theme.dart';

class AuthScreenSvg extends StatelessWidget {
  const AuthScreenSvg({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/images/curve_top.svg',
      color: Palette.activeCardColor,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}
