import 'dart:math';

import 'package:flutter/material.dart';

class ThemeInfo {
  bool isDefault;
  ThemeInfo({@required this.isDefault}) {
    print('Initing ThemeInfo instance with... ${this.isDefault.toString()}');
  }

  void swapColor() {
    isDefault = !isDefault;
  }

  ThemeData createTheme() {
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: color(),
      ),
    );
  }

  ThemeData light() {
    const AMRed = Color(0xFFFF0000);
    const AMBlue = Color(0xFF1870FF);
    const AMGrey = Color(0xFFAEAEAE);
    const AMDGrey = Colors.grey;
    const Black = Colors.black;

    return ThemeData(
      primaryColor: AMRed,
      secondaryHeaderColor: AMBlue,
      hintColor: AMDGrey,
      cardColor: AMGrey,
      focusColor: Black,
    );
  }

  Color color() {
    int r = rand(100, 254);
    int g = rand(100, 254);
    int b = rand(100, 254);
    return Color.fromARGB(255, r, g, b);
  }

  int rand(int min, int max) {
    var random = Random();
    int base = max - min;
    int result = random.nextInt(base);
    return result + min;
  }
}
