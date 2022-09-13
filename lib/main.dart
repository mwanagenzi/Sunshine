import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sunshine/provider/navbar_tab_manager.dart';
import 'package:sunshine/provider/search_screen_state_manager.dart';
import 'package:sunshine/screens/screens.dart';
import 'package:sunshine/sunshine_theme/theme.dart';
import 'app_routing.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchScreenStateManager>(
          create: (_) => SearchScreenStateManager(),
          lazy: true,
        ),
        ChangeNotifierProvider<NavbarTabManager>(
          create: (context) => NavbarTabManager(),
          lazy: true,
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: SunshineTheme.themeData(),
        home: const WelcomeScreen(),
        onGenerateRoute: generateAppRoutes,
      ),
    );
  }
}
