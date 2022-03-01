import 'package:flutter/material.dart';

class AppNavigator {
  final GlobalKey<NavigatorState> appServicesNavKey =
      GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return appServicesNavKey.currentState.pushNamed(routeName);
  }

  void goBack() {
    appServicesNavKey.currentState.pop();
  }
}
