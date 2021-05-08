import 'package:appme/ui/base_widget.dart';
import 'package:appme/ui/ui_enum.dart';
import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  const Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (context, sizingInfo) {
        if (sizingInfo.deviceScreenType == DeviceScreenType.Mobile) {
          return Container(
            child: Image.asset(
              "assets/images/mobile_background.png",
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Container(
            child: Image.asset(
              "assets/images/desktop_background.png",
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}
