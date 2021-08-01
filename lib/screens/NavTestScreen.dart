import 'package:coronaliveupdate/widget/bottomNavigationBar.dart';
import 'package:flutter/material.dart';

class NavTest extends StatefulWidget {
  static const String id = "NavTest";

  const NavTest({Key? key}) : super(key: key);

  @override
  _NavTestState createState() => _NavTestState();
}

class _NavTestState extends State<NavTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BottomNavBar(
            status: NavStatus.File,
          )
        ],
      ),
    );
  }
}
