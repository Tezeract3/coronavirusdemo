import 'package:coronaliveupdate/screens/howToPreventScreen.dart';
import 'package:coronaliveupdate/screens/listScreen.dart';
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
        HowToPreventScreen.id: (context) => HowToPreventScreen(),
        ListScreen.id: (context) => ListScreen(),
      },
    );
  }
}
