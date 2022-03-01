import 'package:appme/constants/colors.dart';
import 'package:appme/drawer/drawer_text.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:flutter/material.dart';

class AppMeDrawer extends StatefulWidget {
  const AppMeDrawer({Key key}) : super(key: key);

  @override
  _AppMeDrawerState createState() => _AppMeDrawerState();
}

class _AppMeDrawerState extends State<AppMeDrawer>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _animationController.forward();
    return SizedWidget(
      theBuilder: (context, sizingInfo) {
        return Container(
          width: 200,
          decoration: BoxDecoration(
            color: AMDGrey.shade800,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.blue,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          height: sizingInfo.screenSize.height - 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SlidedWidget(
                start: 0.1,
                side: -1,
                transitionAnimation: _animationController.view,
                child: DrawerText(
                  text: 'Inicio',
                  bigFont: true,
                  fontFam: 'BronovaR',
                ),
              ),
              SlidedWidget(
                start: 0.4,
                side: -1,
                transitionAnimation: _animationController.view,
                child: DrawerText(
                  text: 'Servicios',
                  bigFont: true,
                  fontFam: 'TekoR',
                ),
              ),
              SlidedWidget(
                start: 0.7,
                side: -1,
                transitionAnimation: _animationController.view,
                child: DrawerText(
                  text: 'Académia',
                  bigFont: true,
                  fontFam: 'Lexend',
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
