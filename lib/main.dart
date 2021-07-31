import 'package:coronaliveupdate/screens/navTestScreen.dart';
import 'package:coronaliveupdate/screens/splashScreenOne.dart';
import 'package:coronaliveupdate/screens/symptomsScreen.dart';
import 'package:flutter/material.dart';

import 'screens/homePage.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        SymptomsScreen.id: (context) => SymptomsScreen(),
        NavTest.id: (context) => NavTest(),
        NavTest2.id: (context) => NavTest2(),
        SplashScreenOne.id: (context) => SplashScreenOne(),
      },
    );
  }
}
