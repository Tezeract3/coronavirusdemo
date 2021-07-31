import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget(
      {required this.confirmCount,
      required this.dethCount,
      required this.activeCount,
      required this.recoverdCount});

  final double confirmCount;
  final double dethCount;
  final double activeCount;
  final double recoverdCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              height: 250,
              margin: EdgeInsets.all(10),
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: confirmCount,
                      color: Color(0xFF4AB6FF),
                      title: '',
                    ),
                    PieChartSectionData(
                      value: dethCount,
                      color: Color(0xFFFF5959),
                      title: '',
                    ),
                    PieChartSectionData(
                      value: activeCount,
                      color: Color(0xFFFFBD4D),
                      title: '',
                    ),
                    PieChartSectionData(
                      value: recoverdCount,
                      color: Color(0xFF4CD979),
                      title: '',
                    ),
                  ],
                  sectionsSpace: 0,
                  centerSpaceRadius: double.infinity,
                  centerSpaceColor: Colors.black,
                ),
                swapAnimationDuration: Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear, // Optional
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 250,
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  PieChartTitle(
                    title: 'Total casses',
                    color: Color(0xFF4AB6FF),
                  ),
                  PieChartTitle(
                    title: 'Recoverd Patients',
                    color: Color(0xFF4CD979),
                  ),
                  PieChartTitle(
                    title: 'Active casses',
                    color: Color(0xFFFFBD4D),
                  ),
                  PieChartTitle(
                    title: 'Death',
                    color: Color(0xFFFF5959),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PieChartTitle extends StatelessWidget {
  const PieChartTitle({required this.title, required this.color});

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5, left: 30),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  height: 10,
                  width: 10,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: color,
                  ),
                ),
                Expanded(
                  child: Text('$title'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
