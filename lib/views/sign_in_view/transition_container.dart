import 'package:appme/locator_services/app_navigator/app_navigator.dart';
import 'package:appme/locator_services/locator.dart';
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
          locator<AppNavigator>().navigateTo('/view2');
        },
      ),
    );
  }
}
