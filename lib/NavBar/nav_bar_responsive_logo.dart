import 'package:appme/services/app_services_navigation.dart';
import 'package:appme/services/drawer_service.dart';
import 'package:appme/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AppMeAnimation extends StatefulWidget {
  final bool mobile;
  AppMeAnimation({Key key, @required this.mobile}) : super(key: key);

  @override
  _AppMeAnimationState createState() => _AppMeAnimationState();
}

class _AppMeAnimationState extends State<AppMeAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      child: Container(
        width: widget.mobile ? 120 : 220,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            child: widget.mobile
                ? Image.asset(
                    'assets/images/barlogosmall.png',
                    fit: BoxFit.contain,
                  )
                : Image.asset(
                    'assets/images/barlogo.png',
                    fit: BoxFit.contain,
                  ),
            onTap: () => locator<AppServicesNavigator>().navigateTo('/view2'),
          ),
        ),
      ),
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: _controller,
          child: child,
        );
      },
    );
  }
}


// class AppMeAnimation extends StatelessWidget {
//   final bool mobile;
//   const AppMeAnimation({Key key, @required this.mobile}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         child: Container(
//           width: mobile ? 150 : 250,
//           child: GestureDetector(
//             child: mobile
//                 ? Image.asset('assets/images/barlogosmall.png')
//                 : Image.asset('assets/images/barlogo.png'),
//             onTap: () => locator<DrawerService>().openDrawer(),
//           ),
//         ),
//       ),
//       curve: Curves.easeInOut,
//       duration: const Duration(milliseconds: 1500),
//       tween: Tween<double>(begin: 0, end: 1),
//       builder: (context, value, supChild) {
//         return FadeTransition(opacity: value, child: supChild);
//       },
//     );
//   }
// }


// class AppMeAnimation extends StatefulWidget {
//   const AppMeAnimation({Key key}) : super(key: key);

//   @override
//   _AppMeAnimationState createState() => _AppMeAnimationState();
// }

// class _AppMeAnimationState extends State<AppMeAnimation>
//     with SingleTickerProviderStateMixin {
//   AnimationController _controller;
//   Animation<double> _animation;

//   @override
//   void initState() {
//     _controller = AnimationController(
//       vsync: this,
//       duration: Duration(milliseconds: 2000),
//     );
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _controller.forward();
//     return FadeTransition(
//       opacity: _animation,
//       child: MouseRegion(
//         cursor: SystemMouseCursors.click,
//         child: GestureDetector(
//           child: Image.asset('assets/images/barlogosmall.png'),
//           onTap: () => locator<DrawerService>().openDrawer(),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
// }
