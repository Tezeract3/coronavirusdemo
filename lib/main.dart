import 'package:coronaliveupdate/screens/NavTestScreen.dart';
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
      home: HomePage(),
      initialRoute: NavTest.id,
      routes: {
        HomePage.id: (context) => HomePage(),
        NavTest.id: (context) => NavTest(),
        NavTest2.id: (context) => NavTest2(),
      },
    );
  }
}
