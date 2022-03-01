import 'package:appme/locator_services/app_navigator/app_navigator.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/router/router.dart';
import 'package:flutter/material.dart';

class AppNavigatorWidget extends StatelessWidget {
  final HeroController heroController;
  const AppNavigatorWidget({Key key, @required this.heroController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: locator<AppNavigator>().appServicesNavKey,
      onGenerateRoute: AppRouter.generateRoute,
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