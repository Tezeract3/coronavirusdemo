import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            //must add the dropdown box
            Container(
              height: 360,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: LiveUpdateDetailWidget(
                          headline: 'Headline 1',
                          value: 'value 1',
                          color: Color(0xFF4AB6FF),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: LiveUpdateDetailWidget(
                          headline: 'Headline 2',
                          value: 'value 2',
                          color: Color(0xFFFF5959),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: LiveUpdateDetailWidget(
                          headline: 'Headline 3',
                          value: 'value 3',
                          color: Color(0xFFFFBD4D),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: LiveUpdateDetailWidget(
                          headline: 'Headline 4',
                          value: 'value 4',
                          color: Color(0xFF4CD979),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF4B6BDB),
                          ),
                          child: Text(
                            'Last updated: 15/06/2021',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

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
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
