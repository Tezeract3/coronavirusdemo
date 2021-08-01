import 'package:coronaliveupdate/screens/howToPreventScreen.dart';
import 'package:coronaliveupdate/screens/symptomsScreen.dart';
import 'package:coronaliveupdate/widget/extraDetailWidget.dart';
import 'package:flutter/material.dart';

class ExtraDetailListWidget extends StatelessWidget {
  const ExtraDetailListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ExtraDetailWidget(
            onTapReadMore: () {
              Navigator.pushNamed(context, HowToPreventScreen.id);
            },
            heading: 'How to prevenr',
            description: 'Covid-19',
            isImageOnLeft: false,
            imagePath: 'images/other/doctor.png',
          ),
          ExtraDetailWidget(
            onTapReadMore: () {
              Navigator.pushNamed(context, SymptomsScreen.id);
            },
            heading: 'Symptoms of',
            description: 'Covid-19',
            isImageOnLeft: true,
            imagePath: 'images/other/patient.png',
          ),
        ],
      ),
    );
  }
}
