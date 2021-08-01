import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LiveUpdateDetailWidget extends StatelessWidget {
  const LiveUpdateDetailWidget(
      {required this.headline, required this.value, required this.color});
  final String headline;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        margin: EdgeInsets.all(0),
        elevation: 3,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              height: 40,
              padding: EdgeInsets.only(left: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              alignment: Alignment.topLeft,
              child: Text(
                '$headline',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Text(
                  "$value ",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
