import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final String family;
  final double fSize;
  final Color color;
  const CustomText(
      {Key key,
      this.text,
      this.family = 'BronovaR',
      this.fSize = 20,
      this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontFamily: family,
        fontSize: fSize,
        color: color,
      ),
    );
  }
}
