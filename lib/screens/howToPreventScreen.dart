import 'package:coronaliveupdate/widget/animationWidget.dart';
import 'package:coronaliveupdate/widget/buttons.dart';
import 'package:coronaliveupdate/widget/backgroundImageWidget.dart';
import 'package:coronaliveupdate/widget/topPanel.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> dataList = [
  {
    "title": "Clean your hands",
    "data":
        "Clean your hands before you put your mask on, as well as before and after you take it off, and after you touch it at any time."
  },
  {
    "title": "Wear a mask",
    "data":
        "when physical distancing is not possible ware a mask and Make sure it covers both your nose, mouth and chin." +
            "When you take off a mask, store it in a clean plastic bag."
  },
  {
    "title": "Stay home if you feel unwell",
    "data":
        "if you have minor symptoms such as cough, headache, mild fever, until you recover. Call your health care provider. Have someone bring you supplies."
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
                  title: "How to prevent",
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
                        child: BackgroundImageWidget(
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
                                title: dataList[i]["title"].toString(),
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
