import 'package:coronaliveupdate/widget/liveUpdateWidget.dart';
import 'package:coronaliveupdate/widget/pieChart.dart';
import 'package:coronaliveupdate/widget/searchBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coronaliveupdate/widget/bottomNavigationBar.dart';

class HomePage extends StatefulWidget {
  static const String id = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: Container(
                child: ListView(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: SearchBar(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
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
                    ),
                    PieChartWidget(
                      confirmCount: 590,
                      dethCount: 800,
                      activeCount: 700,
                      recoverdCount: 500,
                    ),
                  ],
                ),
              ),
            ),
            BottomNavBar(
              status: NavStatus.Home,
            )
          ],
        ),
      ),
    );
  }
}
