import 'package:coronaliveupdate/screens/homePage.dart';
import 'package:flutter/material.dart';

class SplashScreenOne extends StatelessWidget {
  static const String id = "SplashScreenOne";
  const SplashScreenOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            /// left
            Positioned(
              top: size.height * 0.1,
              right: -(size.width * 0.5) / 2,
              child: CoronaPicWidgect(
                opacity: 0.2,
                size: size.width * 0.7,
              ),
            ),

            ///right top
            Positioned(
                bottom: size.height * 0.2,
                left: -50,
                child: CoronaPicWidgect(
                  opacity: 0.2,
                  size: size.width * 0.35,
                )),

            ///bottom center
            Positioned(
              bottom: 0,
              right: size.width * 0.3,
              child: CoronaPicWidgect(),
            ),
            Positioned.fill(
              child: BodyContainer(),
            )
          ],
        ),
      )),
    );
  }
}

class BodyContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///main image
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/icons/chart.png"),
                    fit: BoxFit.fill),
              ),
            ),
          ),

          /// description
          Flexible(
            flex: 1,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "data",
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.w700,
                        fontSize: 25),
                  ),
                  Text(
                    "data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data data .",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.blue.shade900,
                        fontWeight: FontWeight.w400,
                        fontSize: 18),
                  )
                ],
              ),
            ),
          ),

          Flexible(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Flexible(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Color(0xffFFBD4D),
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Next",
                                  style: TextStyle(
                                      color: Colors.blue.shade900,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Icon(Icons.arrow_forward_rounded,
                                  color: Colors.blue.shade900)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Flexible(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, HomePage.id);
                        },
                        child: Container(
                          width: 200,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(15)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Icon(Icons.login, color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}

class CoronaPicWidgect extends StatelessWidget {
  final double size;
  final double opacity;

  const CoronaPicWidgect({Key? key, this.size = 60, this.opacity = 1})
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
