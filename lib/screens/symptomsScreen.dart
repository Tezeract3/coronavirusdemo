import 'package:coronaliveupdate/widget/animationWidget.dart';
import 'package:coronaliveupdate/widget/customBackButton.dart';
import 'package:coronaliveupdate/widget/backgroundImageWidget.dart';
import 'package:coronaliveupdate/widget/customImage.dart';
import 'package:coronaliveupdate/widget/customTitle.dart';
import 'package:flutter/material.dart';

List<Map<String, String>> dataList = [
  {
    "symptom": "Fever",
    "data":
        "Fever is a common symptom of COVID-19, but the actual number of cases is unknown. Fever was the most prevalent symptom"
  },
  {
    "symptom": "Dry Couch",
    "data":
        "this means coughing a lot for more than an hour, or 3 or more coughing episodes in 24 hours (if you usually have a cough, it may be worse than usual)"
  },
  {
    "symptom": "Shortness of breath",
    "data":
        "Shortness of breath can make it hard to breathe. It can leave you gasping for air." +
            "Your chest may feel too tight to inhale or exhale fully. "
  },
  {
    "symptom": "Fatigue",
    "data":
        "Even though fatigue is a less well-known symptom of COVID-19, it’s one of the early signs of the disease and more common than the ‘classic’ symptoms of cough, fever and loss of smell (anosmia)."
  },
  {
    "symptom": "Muscle or body aches",
    "data":
        "COVID-related muscle pains can range from being mild to quite debilitating, especially when they occur alongside fatigue. For some people, this muscle pain stops them from doing day-to-day tasks."
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
            children: [
              /// top panel
              Positioned(
                child: TopPanel(
                  image: "images/other/patient.png",
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
                      Positioned(
                        bottom: -60,
                        left: -80,
                        child: BackgroundImageWidget(
                          size: MediaQuery.of(context).size.width * 0.55,
                          opacity: 0.5,
                        ),
                      ),
                      Positioned(
                        top: 130,
                        right: -90,
                        child: BackgroundImageWidget(
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
                            },
                          ),
                        ),
                      ),
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

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [CustomImage(image: image), CustomTitle(title: title)],
          )
        ],
      ),
    );
  }
}
