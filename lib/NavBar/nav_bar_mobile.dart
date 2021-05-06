import 'package:appme/constants/colors.dart';
import 'package:appme/services/drawer_service.dart';
import 'package:appme/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      height: 80,
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
                    height: 60,
                    width: 60,
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
              AppMeAnimation(),
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

class AppMeAnimation extends StatefulWidget {
  const AppMeAnimation({Key key}) : super(key: key);

  @override
  _AppMeAnimationState createState() => _AppMeAnimationState();
}

class _AppMeAnimationState extends State<AppMeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          child: Image.asset('assets/images/barlogosmall.png'),
          onTap: () => locator<DrawerService>().openDrawer(),
        ),
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
