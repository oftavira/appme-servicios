import 'package:appme/constants/constants.dart';
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
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (context, sizingInfo) {
        return Container(
          width: 200,
          decoration: BoxDecoration(
            color: Theme.of(context).highlightColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColor,
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
                start: 0,
                side: -1,
                transitionAnimation: _animationController.view,
                child: DrawerText(
                  text: 'Inicio',
                  bigFont: true,
                  fontFam: 'BronovaR',
                ),
              ),
              SlidedWidget(
                start: 0.25,
                side: -1,
                transitionAnimation: _animationController.view,
                child: DrawerText(
                  text: 'Servicios',
                  bigFont: true,
                  fontFam: 'TekoR',
                ),
              ),
              SlidedWidget(
                start: 0.5,
                side: -1,
                transitionAnimation: _animationController.view,
                child: DrawerText(
                  text: 'Acad??mia',
                  bigFont: true,
                  fontFam: 'Lexend',
                ),
              ),
              SlidedWidget(
                start: 0.75,
                side: -1,
                transitionAnimation: _animationController.view,
                child: DrawerText(
                  text: 'Articulos',
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
