import 'package:appme/NavBar/nav_bar_responsive.dart';
import 'package:appme/services/locator.dart';
import 'package:appme/services/navigation_service.dart';
import 'package:appme/services/router.dart';
import 'package:appme/utils/contact_info.dart';
import 'package:appme/views/sign_in_view/transition_container.dart';
import 'package:flutter/material.dart';

class ContentNavigationSection extends StatelessWidget {
  const ContentNavigationSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBar(),
        SizedBox(height: 10),
        Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                width: 100,
              ),
              Hero(
                tag: 'sign',
                child: TransitionContainer(
                  width: 100,
                  height: 50,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Center(
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: AppMeRouter.generateRoute,
                initialRoute: '/view1',
              ),
            ),
          ),
        ),
        Container(
          height: 30,
          child: Contact(),
        ),
      ],
    );
  }
}
