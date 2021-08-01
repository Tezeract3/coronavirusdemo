import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  final String title;
  final String data;

  final double labelHeight;

  const AnimationWidget(
      {Key? key,
      required this.title,
      required this.data,
      this.labelHeight = 70})
      : super(key: key);

  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    Container text = Container(
        key: GlobalKey(),
        padding: EdgeInsets.only(
            bottom: 20, left: 20, right: 20, top: widget.labelHeight),
        alignment: Alignment.bottomLeft,
        child: Text(
          widget.data,
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 15),
        ));

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Stack(
        children: [
          ///animation data container
          AnimatedContainer(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffB6C4F1),
            ),
            duration: Duration(milliseconds: 500),
            width: double.maxFinite,
            child: isSelected ? text : null,
          ),

          ///label and button
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            width: double.maxFinite,
            height: widget.labelHeight,
            decoration: BoxDecoration(
              color: Color(0xff4B6BDA),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                IconButton(
                    onPressed: () {
                      isSelected = isSelected ? false : true;

                      setState(() {});
                    },
                    icon: isSelected
                        ? Icon(
                            Icons.keyboard_arrow_up_rounded,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
