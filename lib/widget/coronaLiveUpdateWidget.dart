import 'package:coronaliveupdate/widget/liveUpdateWidget.dart';
import 'package:flutter/material.dart';

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
    String formattedActiveCases = activeCases.replaceAll('+', '');
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
                  value: totalConfirmed.isEmpty
                      ? 'Not provided.'
                      : '$totalConfirmed+',
                  color: Color(0xFF4AB6FF),
                ),
              ),
              Expanded(
                flex: 1,
                child: LiveUpdateDetailWidget(
                  headline: 'Deaths',
                  value:
                      totalDeaths.isEmpty ? 'Not provided.' : '$totalDeaths+',
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
                  value: activeCases.isEmpty || activeCases == 'N/A'
                      ? 'Not provided.'
                      : '$formattedActiveCases+',
                  color: Color(0xFFFFBD4D),
                ),
              ),
              Expanded(
                flex: 1,
                child: LiveUpdateDetailWidget(
                  headline: 'Recovered',
                  value: totalRecovered.isEmpty || activeCases == 'N/A'
                      ? 'Not provided.'
                      : '$totalRecovered+',
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
                  child: lastUpdateDate.isEmpty
                      ? Text(
                          'Last updated: Not provided',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )
                      : Text(
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
