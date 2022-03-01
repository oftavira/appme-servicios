import 'package:appme/views/courses_view/courses_list.dart';
import 'package:appme/views/landing_page_view/landing_view.dart';
import 'package:appme/views/services_view/services_view.dart';
import 'package:appme/views/sign_in_view/sign_in_card.dart';
import 'package:appme/zone_app/content_widget.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/view1':
        return getPageRoute(
          ContentWidget(),
        );

      case '/view2':
        return getPageRoute(
          SignInCard(mobile: false),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}

class ContentRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/view1':
        return getPageRoute(LandingView());

      case '/view2':
        return getPageRoute(ViewTwo());

      case '/view3':
        return getPageRoute(CoursesList());

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
