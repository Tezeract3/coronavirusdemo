import 'dart:convert';

import 'package:coronaliveupdate/entities/LiveCovidUpdate.dart';
import 'package:coronaliveupdate/widget/extraDetailWidget.dart';
import 'package:coronaliveupdate/widget/liveUpdateWidget.dart';
import 'package:coronaliveupdate/widget/pieChart.dart';
import 'package:coronaliveupdate/widget/searchBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:coronaliveupdate/widget/bottomNavigationBar.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

Future<LiveCovidUpdate> fetchCoronaRes(String country) async {
  final response =
      await http.get(Uri.parse('https://covid-19.dataflowkit.com/v1/$country'));

  if (response.statusCode == 200) {
    return LiveCovidUpdate.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class HomePage extends StatefulWidget {
  static const String id = "HomePage";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late Future<LiveCovidUpdate> coronaLiveUpdate;
  late Future<LiveCovidUpdate> coronaLiveUpdate;

  @override
  void initState() {
    //coronaLiveUpdate = GetCoronaDetails.getLiveCoronaUpdate('World');
    super.initState();
    coronaLiveUpdate = fetchCoronaRes('World');
  }

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
                      height: 200,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ExtraDetailWidget(
                            heading: 'Heading 1',
                            description: 'Description 1',
                            isImageOnLeft: false,
                            imagePath: 'images/other/doctor.png',
                          ),
                          ExtraDetailWidget(
                            heading: 'Heading 1',
                            description: 'Description 2',
                            isImageOnLeft: true,
                            imagePath: 'images/other/patient.png',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: SearchBar(),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    //must add the dropdown box
                    FutureBuilder<LiveCovidUpdate>(
                      future: coronaLiveUpdate,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          double confirmCountInt = double.parse(
                              snapshot.data!.totalCases.replaceAll(',', ''));
                          double activeCountInt = double.parse(
                              snapshot.data!.activeCases.replaceAll(',', ''));
                          double deathCountInt = double.parse(
                              snapshot.data!.totalDeaths.replaceAll(',', ''));
                          double recoveredCountInt = double.parse(snapshot
                              .data!.totalRecovered
                              .replaceAll(',', ''));

                          return Column(
                            children: [
                              CoronaLiveUpdateContainer(
                                activeCases: snapshot.data!.activeCases,
                                totalDeaths: snapshot.data!.totalDeaths,
                                totalRecovered: snapshot.data!.totalRecovered,
                                totalConfirmed: snapshot.data!.totalCases,
                                lastUpdateDate: snapshot.data!.lastUpdateDate,
                                country: snapshot.data!.countryName,
                              ),
                              PieChartWidget(
                                confirmCount: confirmCountInt,
                                dethCount: activeCountInt,
                                activeCount: deathCountInt,
                                recoverdCount: recoveredCountInt,
                              ),
                            ],
                          );
                        }
                        return const CircularProgressIndicator();
                      },
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

class CoronaLiveUpdateContainer extends StatelessWidget {
  const CoronaLiveUpdateContainer(
      {required this.activeCases,
      required this.lastUpdateDate,
      required this.totalConfirmed,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.country});

  final String totalConfirmed;
  final String totalDeaths;
  final String activeCases;
  final String totalRecovered;
  final String lastUpdateDate;
  final String country;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 420,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
                    'Country: $country',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
                  headline: 'Confirmed',
                  value: '$totalConfirmed+',
                  color: Color(0xFF4AB6FF),
                ),
              ),
              Expanded(
                flex: 1,
                child: LiveUpdateDetailWidget(
                  headline: 'Deaths',
                  value: '$totalDeaths+',
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
                  headline: 'Active',
                  value: '$activeCases+',
                  color: Color(0xFFFFBD4D),
                ),
              ),
              Expanded(
                flex: 1,
                child: LiveUpdateDetailWidget(
                  headline: 'Recovered',
                  value: '$totalRecovered+',
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
                    'Last updated: $lastUpdateDate',
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
    );
  }
}
