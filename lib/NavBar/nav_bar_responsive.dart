import 'package:appme/NavBar/nav_bar_mobile.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:appme/ui/ui_enum.dart';
import 'package:flutter/material.dart';
import 'nav_bar_desktop.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Mobile) {
          return NavBarMobile();
        } else {
          return NavBarTablet();
        }
      },
    );
  }
}
