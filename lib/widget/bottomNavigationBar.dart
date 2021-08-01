import 'package:coronaliveupdate/screens/homePage.dart';
import 'package:coronaliveupdate/screens/listScreen.dart';
import 'package:flutter/material.dart';

List<BoxShadow> bottomNavBarShadow = [
  BoxShadow(
    color: Colors.black26,
    blurRadius: 10,
    spreadRadius: 5,
    offset: Offset(-1, 1),
  )
];

enum NavStatus { Home, File }

double verticalPadding = 10;
double horisontalPadding = 20;

class BottomNavBar extends StatefulWidget {
  final NavStatus status;

  BottomNavBar({Key? key, this.status = NavStatus.Home}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<bool> select = [false, false];
  void changeStatus() {
    select = [false, false];
    switch (widget.status) {
      case NavStatus.Home:
        {
          select[0] = true;
        }
        break;
      case NavStatus.File:
        {
          select[1] = true;
        }
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    changeStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horisontalPadding),
      width: double.maxFinite,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black26, width: 1),
        boxShadow: bottomNavBarShadow,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavButton(
            image: "images/icons/homeIcon.png",
            isSelected: select[0],
            onTap: () {
              Navigator.popAndPushNamed(context, HomePage.id);
            },
          ),
          SizedBox(
            width: 50,
          ),
          NavButton(
            image: "images/icons/textIcon.png",
            isSelected: select[1],
            onTap: () {
              Navigator.pushNamed(context, ListScreen.id);
            },
          ),
        ],
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final String image;

  final Function onTap;

  final bool isSelected;

  const NavButton(
      {Key? key,
      required this.image,
      this.isSelected = false,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      ),
    ];

    if (isSelected) {
      list.add(
        Hero(
          tag: "1",
          child: SizedBox(
            height: 10,
            width: 60,
            child: Divider(
              thickness: 3,
              color: Colors.blueAccent,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: list,
      ),
    );
  }
}
