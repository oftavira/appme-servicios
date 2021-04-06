import 'package:appme/ui/ui_enum.dart';
import 'package:flutter/cupertino.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQueryData) {
  double width = 0;

  width = mediaQueryData.size.shortestSide;

  if (width > 950) {
    return DeviceScreenType.Desktop;
  }

  if (width > 600) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
