import 'package:appme/constants/constants.dart';
import 'package:appme/locator_services/content_navigator/content_navigator.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
            color: Colors.black,
            border: Border.all(color: Colors.white, width: 0.5),
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
          locator<ContentNavigator>().navigateTo(routes[text]);
        },
      ),
    );
  }
}

class SlidedWidget extends StatelessWidget {
  final Widget child;
  final double side;
  final double start;
  final Animation<double> transitionAnimation;
  const SlidedWidget(
      {Key key,
      @required this.start,
      @required this.child,
      @required this.transitionAnimation,
      @required this.side})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: transitionAnimation,
      builder: (context, child) {
        return SlideTransition(
          position:
              Tween<Offset>(begin: Offset(side, 0), end: Offset.zero).animate(
            CurvedAnimation(
              parent: transitionAnimation,
              curve: Interval(start, start + 0.3, curve: Curves.easeInOut),
            ),
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
