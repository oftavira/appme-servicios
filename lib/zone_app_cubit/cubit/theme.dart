import 'package:flutter/material.dart';

class ThemeInfo {
  bool isDefault;
  ThemeInfo({@required this.isDefault}) {
    print('Initing ThemeInfo instance with... ${this.isDefault.toString()}');
  }

  void swapColor() {
    isDefault = !isDefault;
  }
}
