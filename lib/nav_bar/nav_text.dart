import 'package:appme/constants/constants.dart';
import 'package:appme/locator_services/content_navigator/content_navigator.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class NavBarText extends StatelessWidget {
  final bool bigFont;
  final String text;
  final String fontFam;
  const NavBarText({Key key, this.text, this.fontFam, this.bigFont = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontS = 14;
    if (bigFont) {
      fontS = 22;
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontS, color: Colors.white, fontFamily: 'TekoB'),
        ),
        onTap: () {
          locator<ContentNavigator>().navigateTo(routes[text]);
        },
      ),
    );
  }
}
