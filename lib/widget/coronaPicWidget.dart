import 'package:flutter/material.dart';

class CoronaPicWidget extends StatelessWidget {
  final double size;
  final double opacity;

  const CoronaPicWidget({Key? key, this.size = 60, this.opacity = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.white.withOpacity(opacity), BlendMode.dstATop),
            image: AssetImage("images/icons/corona.png"),
            fit: BoxFit.fill),
      ),
    );
  }
}
