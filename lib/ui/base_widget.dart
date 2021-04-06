import 'package:appme/ui/sizing_information.dart';
import 'package:appme/ui/ui_utils.dart';
import 'package:flutter/material.dart';

class SizedWidget extends StatelessWidget {
  final Widget Function(
      BuildContext context, SizingInformation sizingInformation) theBuilder;
  const SizedWidget({Key key, this.theBuilder}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var mediaQuery = MediaQuery.of(context);
        var sizingInformation = SizingInformation(
          orientation: mediaQuery.orientation,
          deviceScreenType: getDeviceType(mediaQuery),
          screenSize: mediaQuery.size,
          widgetSize: Size(constraints.maxWidth, constraints.maxHeight),
        );

        return theBuilder(context, sizingInformation);
      },
    );
  }
}
