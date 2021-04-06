import 'package:appme/ui/ui_enum.dart';
import 'package:flutter/material.dart';

class SizingInformation {
  final Orientation orientation;
  final DeviceScreenType deviceScreenType;
  final Size screenSize;
  final Size widgetSize;

  SizingInformation(
      {this.orientation,
      this.deviceScreenType,
      this.screenSize,
      this.widgetSize});

  @override
  String toString() {
    return 'orientation: $orientation deviceScreenType: $deviceScreenType screenSize: $screenSize widgetSize: $widgetSize';
  }

  bool get mobile => deviceScreenType == DeviceScreenType.Mobile;
}
