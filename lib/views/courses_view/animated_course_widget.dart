import 'package:appme/constants/constants.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:flutter/material.dart';

class AnimatedCourseWidget extends StatelessWidget {
  final Animation<double> opacity;
  final Animation<double> sizing;
  final Animation<double> sizingH;
  final AnimationController controller;

  final Map<String, String> details;
  final bool mobile;

  AnimatedCourseWidget(
      {Key key,
      @required this.details,
      @required this.mobile,
      @required this.controller})
      : opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.6, 1, curve: Curves.easeIn),
          ),
        ),
        sizing = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.2, 0.4, curve: Curves.easeIn),
          ),
        ),
        sizingH = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.4, 0.6, curve: Curves.easeIn),
          ),
        ),
        super(key: key);

  static const List keys = [
    "Aprendizajes",
    "Requisitos",
    "Clase vía",
    "Edad recomendada"
  ];

  String assetPath(String asset, bool mobile) {
    String template = "assets/courses/";
    String path =
        mobile ? template + "${asset}350.png" : template + "${asset}500.png";
    return path;
  }

  Widget _buildAnimation(BuildContext context, Widget child) {
    return SizedWidget(
      theBuilder: (context, sizingInfo) {
        return Container(
          height: mobile ? 110 * (sizingH.value) : 150 * (sizingH.value),
          width: sizingInfo.widgetSize.width * (sizing.value),
          decoration: BoxDecoration(
            color: Black.withOpacity(0.9),
            border: Border.all(color: Colors.white),
          ),
          child: FadeTransition(
            opacity: opacity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  assetPath(details['asset'], mobile),
                  fit: BoxFit.cover,
                  height: mobile ? 110 : 150,
                  width: mobile ? 110 : 150,
                ),
                SizedBox(
                  width: mobile ? 10 : 15,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: mobile ? 10 : 15,
                      ),
                      Center(
                        child: Text(
                          details['Nombre'],
                          style: TextStyle(
                              fontFamily: 'BioMonster',
                              fontSize: mobile ? 18 : 25,
                              color: Colors.amber),
                        ),
                      ),
                      SizedBox(
                        height: mobile ? 10 : 15,
                      ),
                      Expanded(
                        child: Column(
                          children: keys
                              .map(
                                (e) => Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    KeyText(
                                      text: e + ": ",
                                      fontSize: mobile ? 10 : 18,
                                    ),
                                    PropertieText(
                                      text: details[e],
                                      fontSize: mobile ? 10 : 18,
                                    ),
                                  ],
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}

class KeyText extends StatelessWidget {
  final String text;
  final double fontSize;
  const KeyText({Key key, @required this.text, @required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey[200],
        fontFamily: 'BronovaB',
        fontSize: fontSize,
      ),
    );
  }
}

class PropertieText extends StatelessWidget {
  final String text;
  final double fontSize;
  const PropertieText({Key key, @required this.text, @required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontFamily: 'BronovaR',
        fontSize: fontSize,
      ),
    );
  }
}
