import 'package:appme/services/app_services_navigation.dart';
import 'package:appme/services/locator.dart';
import 'package:appme/services/router.dart';
import 'package:flutter/material.dart';

class AppServicesNavigationView extends StatelessWidget {
  final HeroController heroController;
  const AppServicesNavigationView({Key key, @required this.heroController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: locator<AppServicesNavigator>().appServicesNavKey,
      onGenerateRoute: AppServicesRouter.generateRoute,
      initialRoute: '/view1',
      observers: [heroController],
    );
  }
}

// Column(
//           children: [
//             NavBar(),
//             SizedBox(height: 10),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.all(10),
//                 alignment: Alignment.center,
//                 child: Center(
//                   child: ContentNavigationSection(),
//                 ),
//               ),
//             ),
//             Container(
//               height: 30,
//               child: Contact(),
//             ),
//           ],
//         ),