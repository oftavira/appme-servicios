import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }

  void testingRoutes(BuildContext context, Widget view) {
    navigatorKey.currentState.push(
      PageRouteBuilder(pageBuilder: (ctx, animation, secondaryAnimation) {
        return view;
      }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      }),
    );
  }
}
