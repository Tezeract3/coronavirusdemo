import 'dart:convert';

import 'package:coronaliveupdate/entities/LiveCovidUpdate.dart';
import 'package:coronaliveupdate/methods/searchBar.dart';
import 'package:coronaliveupdate/screens/howToPreventScreen.dart';
import 'package:coronaliveupdate/screens/symptomsScreen.dart';
import 'package:coronaliveupdate/widget/bottomNavigationBar.dart';
import 'package:coronaliveupdate/widget/coronaLiveUpdateWidget.dart';
import 'package:coronaliveupdate/widget/backgroundImageWidget.dart';
import 'package:coronaliveupdate/widget/extraDetailWidget.dart';
import 'package:coronaliveupdate/widget/pieChart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  late Future<LiveCovidUpdate> coronaLiveUpdate;

  @override
  void initState() {
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
                child: Stack(
                  children: [
                    Positioned(
                      right: -70,
                      top: 230,
                      child: BackgroundImageWidget(
                        opacity: 0.5,
                        size: MediaQuery.of(context).size.shortestSide * 0.8,
                      ),
                    ),
                    Column(
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
                                        onTapReadMore: () {
                                          Navigator.pushNamed(
                                              context, HowToPreventScreen.id);
                                        },
                                        heading: 'How to prevenr',
                                        description: 'Covid-19',
                                        isImageOnLeft: false,
                                        imagePath: 'images/other/doctor.png',
                                      ),
                                      ExtraDetailWidget(
                                        onTapReadMore: () {
                                          Navigator.pushNamed(
                                              context, SymptomsScreen.id);
                                        },
                                        heading: 'Symptoms of',
                                        description: 'Covid-19',
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
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(),
                                  ),
                                  child: TextButton(
                                    onPressed: () async {
                                      var countryName = await showSearch(
                                        context: context,
                                        delegate: CountrySearch(),
                                      );

                                      Future<LiveCovidUpdate> coronaUpdate =
                                          fetchCoronaRes('$countryName');

                                      setState(() {
                                        coronaLiveUpdate = coronaUpdate;
                                      });
                                    },
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 10, right: 10),
                                          child: Icon(Icons.search),
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Search a country',
                                            style: TextStyle(
                                                color: Color(0xFF848488)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                //must add the dropdown box
                                FutureBuilder<LiveCovidUpdate>(
                                  future: coronaLiveUpdate,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      double confirmCountInt =
                                          snapshot.data!.totalCases.isEmpty
                                              ? 0.0
                                              : double.parse(snapshot
                                                  .data!.totalCases
                                                  .replaceAll(',', '')
                                                  .replaceAll('+', ''));

                                      double activeCountInt =
                                          snapshot.data!.activeCases.isEmpty ||
                                                  snapshot.data!.activeCases ==
                                                      'N/A'
                                              ? 0.0
                                              : double.parse(snapshot
                                                  .data!.activeCases
                                                  .replaceAll(',', '')
                                                  .replaceAll('+', ''));

                                      double deathCountInt =
                                          snapshot.data!.totalDeaths.isEmpty
                                              ? 0.0
                                              : double.parse(snapshot
                                                  .data!.totalDeaths
                                                  .replaceAll(',', '')
                                                  .replaceAll('+', ''));

                                      double recoveredCountInt = snapshot.data!
                                                  .totalRecovered.isEmpty ||
                                              snapshot.data!.totalRecovered ==
                                                  'N/A'
                                          ? 0.0
                                          : double.parse(snapshot
                                              .data!.totalRecovered
                                              .replaceAll(',', '')
                                              .replaceAll('+', ''));

                                      return Column(
                                        children: [
                                          CoronaLiveUpdateContainer(
                                            activeCases:
                                                snapshot.data!.activeCases,
                                            totalDeaths:
                                                snapshot.data!.totalDeaths,
                                            totalRecovered:
                                                snapshot.data!.totalRecovered,
                                            totalConfirmed:
                                                snapshot.data!.totalCases,
                                            lastUpdateDate:
                                                snapshot.data!.lastUpdateDate,
                                            country: snapshot.data!.countryName,
                                          ),
                                          PieChartWidget(
                                            confirmCount: confirmCountInt,
                                            dethCount: deathCountInt,
                                            activeCount: activeCountInt,
                                            recoverdCount: recoveredCountInt,
                                          ),
                                        ],
                                      );
                                    }
                                    return Container(
                                      child: Center(
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: Transform.scale(
                                            scale: 0.5,
                                            child: CircularProgressIndicator(),
                                          ),
                                        ),
                                      ),
                                    );
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
