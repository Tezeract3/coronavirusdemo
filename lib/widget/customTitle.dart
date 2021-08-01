import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 25),
          ),
          Text(
            "Covid-19",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20),
          )
        ],
      ),
    );
  }
}

