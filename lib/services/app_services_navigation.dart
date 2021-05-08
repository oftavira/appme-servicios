import 'package:flutter/material.dart';

class AppServicesNavigator {
  final GlobalKey<NavigatorState> appServicesNavKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return appServicesNavKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    appServicesNavKey.currentState.pop();
  }
}
