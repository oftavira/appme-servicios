import 'package:appme/constants/constants.dart';
import 'package:appme/locator_services/drawer/drawer_service.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:flutter/material.dart';
import 'nav_bar_responsive_logo.dart';

class NavBarMobile extends StatelessWidget {
  const NavBarMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Colors.black,
            AMGrey,
          ],
        ),
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: AMGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () => locator<DrawerService>().openDrawer(),
                ),
              ),
            ],
          ),
          Row(
            children: [
              AppMeAnimation(
                mobile: true,
              ),
              SizedBox(
                width: 10,
              ),
            ],
          )
        ],
      ),
    );
  }
}

// return TweenAnimationBuilder(
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         child: GestureDetector(
//           child: Image.asset('assets/images/barlogosmall.png'),
//           onTap: () => locator<DrawerService>().openDrawer(),
//         ),
//       ),
//       curve: Curves.decelerate,
//       duration: Duration(milliseconds: 550),
//       tween: Tween<double>(begin: 0, end: 1),
//       builder: (context, value, supChild) {
//         return AnimatedOpacity(
//             opacity: value,
//             child: Row(
//               children: [
//                 supChild,
//                 SizedBox(
//                   width: 40 * (1 - value),
//                 ),
//               ],
//             ));
//       },
//     );
