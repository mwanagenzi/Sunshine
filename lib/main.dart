import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/app_routing.dart';
import 'package:sunshine/home.dart';
import 'package:sunshine/provider/providers.dart';
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
      home: ChangeNotifierProvider<NavbarTabManager>(
        create: (context) => NavbarTabManager(),
        child: const Home(),
      ),
      onGenerateRoute: generateAppRoutes,
    );
  }
}
