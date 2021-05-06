import 'package:appme/views/academy_view/availablecourses.dart';
import 'package:appme/views/landing/landing_view.dart';
import 'package:appme/views/services_view/services_view.dart';
import 'package:flutter/material.dart';

class AppMeRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/view1':
        return getPageRoute(LandingView());

      case '/view2':
        return getPageRoute(ViewTwo());

      case '/view3':
        return getPageRoute(ResponsiveListCourses());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

PageRoute getPageRoute(Widget child) {
  return _FadeRoute(
    child: child,
  );
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  _FadeRoute({this.child})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
