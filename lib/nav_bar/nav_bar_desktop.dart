import 'package:appme/constants/constants.dart';
import 'package:appme/nav_bar/nav_text.dart';
import 'package:flutter/material.dart';
import 'nav_bar_responsive_logo.dart';

class NavBarTablet extends StatelessWidget {
  const NavBarTablet({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
          colors: [
            AMGrey,
            Colors.black,
          ],
        ),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              NavBarText(
                text: 'Inicio',
                bigFont: true,
                fontFam: 'BronovaR',
              ),
              SizedBox(
                width: 20,
              ),
              NavBarText(
                text: 'Servicios',
                bigFont: true,
                fontFam: 'TekoR',
              ),
              SizedBox(
                width: 20,
              ),
              NavBarText(
                text: 'Académia',
                bigFont: true,
                fontFam: 'Lexend',
              ),
            ],
          ),
          Row(
            children: [
              AppMeAnimation(
                mobile: false,
              ),
              SizedBox(
                width: 40,
              )
            ],
          )
        ],
      ),
    );
  }
}
