import 'package:coronaliveupdate/widget/animationWidget.dart';
import 'package:coronaliveupdate/widget/buttons.dart';
import 'package:coronaliveupdate/widget/coronaPicWidget.dart';
import 'package:coronaliveupdate/widget/topPanel.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> dataList = [
  {
    "symptom": "Wash your hands",
    "data":
        "janindu data data data data data data data data data data data data data data data data data data data data data data data data data data data "
  },
  {
    "symptom": "Use Hand sanitizers",
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

class HowToPreventScreen extends StatefulWidget {
  static const String id = "HowToPreventScreen";

  const HowToPreventScreen({Key? key}) : super(key: key);

  @override
  _HowToPreventScreenState createState() => _HowToPreventScreenState();
}

class _HowToPreventScreenState extends State<HowToPreventScreen> {
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
            children: [
              /// top panel
              Positioned(
                child: TopPanel(
                  image: "images/other/doctor.png",
                  title: "Symptoms of",
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
                        top: 20,
                        left: -40,
                        child: CoronaPicWidget(
                          size: MediaQuery.of(context).size.width * 0.35,
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
          ),
        ),
      ),
    );
  }
}

class TopPanel extends StatelessWidget {
  final String image;
  final String title;

  const TopPanel({Key? key, required this.image, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          ///back Button
          CustomBackButton(),
          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///title
              CustomTitle(title: title),

              ///picture
              CustomImage(image: image),
            ],
          )
        ],
      ),
    );
  }
}
