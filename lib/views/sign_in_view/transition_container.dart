import 'package:appme/app_services_nav_view.dart';
import 'package:appme/services/app_services_navigation.dart';
import 'package:appme/services/locator.dart';
import 'package:flutter/material.dart';

class TransitionContainer extends StatelessWidget {
  final double width;
  final double height;
  const TransitionContainer({Key key, this.width, this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: Colors.pink,
      child: GestureDetector(
        onTap: () {
          locator<AppServicesNavigator>().navigateTo('/view2');
        },
      ),
    );
  }
}
