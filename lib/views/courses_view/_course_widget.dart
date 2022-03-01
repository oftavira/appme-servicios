import 'package:appme/constants/colors.dart';
import 'package:flutter/material.dart';

class CourseWidget extends StatelessWidget {
  final Map<String, String> details;
  final bool mobile;
  const CourseWidget({Key key, @required this.details, @required this.mobile})
      : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mobile ? 110 : 150,
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.9),
        border: Border.all(color: Colors.white),
      ),
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
    );
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
