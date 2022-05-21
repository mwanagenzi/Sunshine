import 'package:flutter/material.dart';
import 'package:sunshine/app_routing.dart';
import 'package:sunshine/screens/screens.dart';
import 'package:sunshine/sunshine_theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const Sunshine());
}

class Sunshine extends StatelessWidget {
  const Sunshine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SunshineTheme.themeData(),
      home: const WelcomeScreen(),
      onGenerateRoute: generateAppRoutes,
    );
    
  }
}
