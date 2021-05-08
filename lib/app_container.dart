import 'package:appme/app_services_nav_view.dart';
import 'package:flutter/material.dart';

class NavContent extends StatelessWidget {
  const NavContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(
          top: 40,
          bottom: 10,
        ),
        // color: Colors.purple[100],
        constraints: BoxConstraints(
            minWidth: 50.0,
            minHeight: 50.0,
            maxWidth: 900.0,
            maxHeight: 1000.0),
        child: AppServicesNavigationView(
          heroController: HeroController(),
        ),
      ),
    );
  }
}
