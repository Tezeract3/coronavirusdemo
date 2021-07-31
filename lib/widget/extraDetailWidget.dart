import 'package:flutter/material.dart';

class ExtraDetailWidget extends StatelessWidget {
  const ExtraDetailWidget({required this.description, required this.heading});

  final String heading;
  final String description;

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
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Container(
                      width: 200,
                      padding: EdgeInsets.only(left: 25, top: 25),
                      alignment: Alignment.topLeft,
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
                      padding: EdgeInsets.only(left: 25),
                      alignment: Alignment.topLeft,
                      child: Text(
                        '$description',
                        style: TextStyle(
                          color: Colors.white54,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: 200,
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        padding: EdgeInsets.only(right: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: null,
                            child: Container(
                              color: Colors.red,
                              child: Row(
                                children: [
                                  Text('Read more'),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 18,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 200,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("images/other/doctor.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
