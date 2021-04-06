import 'package:appme/constants/colors.dart';
import 'package:appme/services/locator.dart';
import 'package:appme/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

const Map<String, String> routes = {
  'Inicio': '/view1',
  'Servicios': '/view2',
  'Académia': '/view3',
};

class NavBarText extends StatelessWidget {
  final bool bigFont;
  final String text;
  final String fontFam;
  const NavBarText({Key key, this.text, this.fontFam, this.bigFont = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontS = 16;
    if (bigFont) {
      fontS = 24;
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
          locator<NavigationService>().navigateTo(routes[text]);
        },
      ),
    );
  }
}

class DrawerText extends StatelessWidget {
  final bool bigFont;
  final String text;
  final String fontFam;
  const DrawerText({Key key, this.text, this.fontFam, this.bigFont = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontS = 10;
    if (bigFont) {
      fontS = 24;
    }
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 0.5),
            gradient: LinearGradient(
                colors: [Colors.black, AMBlue],
                stops: [0.95, 1],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white, fontSize: fontS, fontFamily: 'TekoR'),
            ),
          ),
        ),
        onTap: () {
          locator<NavigationService>().navigateTo(routes[text]);
        },
      ),
    );
  }
}
