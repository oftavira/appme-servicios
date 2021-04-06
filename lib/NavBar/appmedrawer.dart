import 'package:appme/NavBar/nav_text.dart';
import 'package:appme/constants/colors.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:flutter/material.dart';

class AppMeDrawer extends StatelessWidget {
  const AppMeDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (context, sizingInfo) {
        return Container(
          width: 200,
          decoration: BoxDecoration(
            color: AMTBlack,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          height: sizingInfo.screenSize.height - 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerText(
                text: 'Inicio',
                bigFont: true,
                fontFam: 'BronovaR',
              ),
              DrawerText(
                text: 'Servicios',
                bigFont: true,
                fontFam: 'TekoR',
              ),
              DrawerText(
                text: 'Académia',
                bigFont: true,
                fontFam: 'Lexend',
              ),
            ],
          ),
        );
      },
    );
  }
}
