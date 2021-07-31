import 'package:coronaliveupdate/widget/animationWidget.dart';
import 'package:coronaliveupdate/widget/coronaPicWidget.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> dataList = [
  {
    "symptom": "Heigh Fever",
    "data":
        "janindu data data data data data data data data data data data data data data data data data data data data data data data data data data data "
  },
  {
    "symptom": "Dry Couch",
    "data":
        "janindu data data data data data data data data data data data data data data data data data data data data data data data data data data data "
  },
  {
    "symptom": "Heigh Fever",
    "data":
        "janindu data data data data data data data data data data data data data data data data data data data data data data data data data data data "
  },
  {
    "symptom": "Heigh Fever",
    "data":
        "janindu data data data data data data data data data data data data data data data data data data data data data data data data data data data "
  },
  {
    "symptom": "Heigh Fever",
    "data":
        "janindu data data data data data data data data data data data data data data data data data data data data data data data data data data data "
  },
];

class SymptomsScreen extends StatefulWidget {
  static const String id = "SymptomsScreen";
  const SymptomsScreen({Key? key}) : super(key: key);

  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4B6BDA),
      body: SafeArea(
        bottom: false,
        child: Container(
            padding: EdgeInsets.only(top: 10),
            width: double.maxFinite,
            height: double.maxFinite,
            child: Stack(
              // mainAxisSize: MainAxisSize.max,
              children: [
                /// top panel
                Positioned(
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        ///back Button
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Back",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///picture
                            Flexible(
                                child: Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                  // color: Colors.red,
                                  image: DecorationImage(
                                      image: AssetImage("images/icons/man.png"),
                                      fit: BoxFit.fitHeight)),
                            )),

                            ///title
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Symptoms of",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "Covid-19",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 20),
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                ///bottom panel
                Positioned.fill(
                  top: 220,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15))),
                    child: Stack(
                      children: [
                        ///corona
                        Positioned(
                          bottom: -60,
                          left: -80,
                          child: CoronaPicWidget(
                            size: MediaQuery.of(context).size.width * 0.55,
                            opacity: 0.5,
                          ),
                        ),

                        ///corona
                        Positioned(
                          top: 130,
                          right: -90,
                          child: CoronaPicWidget(
                            size: MediaQuery.of(context).size.width * 0.55,
                            opacity: 0.5,
                          ),
                        ),

                        ///list body
                        Positioned.fill(
                            child: Container(
                          margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                          child: ListView.builder(
                              itemCount: dataList.length,
                              itemBuilder: (context, i) {
                                return AnimationWidget(
                                  data: dataList[i]["data"].toString(),
                                  title: dataList[i]["symptom"].toString(),
                                );
                              }),
                        )),
                      ],
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
