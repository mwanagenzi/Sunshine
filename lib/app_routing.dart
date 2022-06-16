import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/provider/providers.dart';
import 'package:sunshine/screens/screens.dart';
import 'package:sunshine/utils/constants.dart';

import 'home.dart';

Route<dynamic> generateAppRoutes(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.welcome:
      {
        return MaterialPageRoute(builder: (context) => const WelcomeScreen());
      }
    case AppRoutes.signUp:
      {
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      }
    case AppRoutes.login:
      {
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      }
    case AppRoutes.resetPassword:
      {
        return MaterialPageRoute(
            builder: (context) => const ResetPasswordScreen());
      }
    case AppRoutes.home:
      {
        return MaterialPageRoute(
          builder: (context) => ChangeNotifierProvider<NavbarTabManager>(
            create: (context) => NavbarTabManager(),
            child: const Home(),
          ),
        );
      }
    case AppRoutes.weeklyForecast:
      {
        return MaterialPageRoute(
            builder: (context) => const WeeklyForecastScreen());
      }
    case AppRoutes.search:
      {
        return MaterialPageRoute(builder: (context) => SearchLocationScreen());
      }
      
    default:
      {
        return MaterialPageRoute(builder: ((context) => const ErrorScreen()));
      }
  }
}
