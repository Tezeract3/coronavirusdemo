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

class CustomImage extends StatelessWidget {
  const CustomImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
          // color: Colors.red,
          image:
              DecorationImage(image: AssetImage(image), fit: BoxFit.fitHeight)),
    ));
  }
}
