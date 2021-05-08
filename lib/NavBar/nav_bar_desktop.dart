import 'package:appme/NavBar/nav_text.dart';
import 'package:appme/constants/colors.dart';
import 'package:appme/services/drawer_service.dart';
import 'package:appme/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      height: 100,
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
