import 'package:appme/locator_services/content_navigator/content_navigator.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/router/router.dart';
import 'package:appme/zone_app/app_constrained_container.dart';
import 'package:flutter/material.dart';

class ContentNavigatorWidget extends StatelessWidget {
  const ContentNavigatorWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppConstrainedContainer(
      child: Navigator(
        key: locator<ContentNavigator>().navigatorKey,
        onGenerateRoute: ContentRouter.generateRoute,
        initialRoute: '/view1',
      ),
    );
  }
}
