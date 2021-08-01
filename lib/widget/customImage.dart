import 'package:flutter/material.dart';

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
            image: DecorationImage(
                image: AssetImage(image), fit: BoxFit.fitHeight)),
      ),
    );
  }
}
