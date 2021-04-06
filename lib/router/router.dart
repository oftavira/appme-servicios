import 'package:appme/views/academy_view/availablecourses.dart';
import 'package:appme/views/landing/landing_view.dart';
import 'package:appme/views/services_view/services_view.dart';
import 'package:flutter/material.dart';

class AppMeRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/view1':
        return MaterialPageRoute(
          builder: (_) => LandingView(),
        );

      case '/view2':
        return MaterialPageRoute(
          builder: (_) => ViewTwo(),
        );

      case '/view3':
        return MaterialPageRoute(
          builder: (_) => ResponsiveListCourses(),
        );

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
