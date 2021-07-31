import 'package:coronaliveupdate/screens/symptomsScreen.dart';
import 'package:flutter/material.dart';

class ExtraDetailWidget extends StatelessWidget {
  const ExtraDetailWidget({
    required this.description,
    required this.heading,
    required this.isImageOnLeft,
    required this.imagePath,
  });

  final String heading;
  final String description;
  final bool isImageOnLeft;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      height: 200,
      width: 400,
      child: Stack(
        children: [
          Positioned(
            top: 50,
            height: 150,
            width: 400,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              padding: EdgeInsets.all(0),
              height: 150,
              child: Container(
                height: 150,
                alignment:
                    isImageOnLeft ? Alignment.topRight : Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      padding: EdgeInsets.only(left: 25, top: 25, right: 25),
                      alignment: isImageOnLeft
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        '$heading',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      width: 200,
                      padding: EdgeInsets.only(left: 25, right: 25),
                      alignment: isImageOnLeft
                          ? Alignment.topRight
                          : Alignment.topLeft,
                      child: Text(
                        '$description',
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: isImageOnLeft ? 0 : 200,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
            top: isImageOnLeft ? 140.0 : 140.0,
            left: isImageOnLeft ? 200.0 : 100.0,
            child: TextButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, SymptomsScreen.id);
              },
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Read more',
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
