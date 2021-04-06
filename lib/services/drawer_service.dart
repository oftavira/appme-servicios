import 'package:flutter/material.dart';

class DrawerService {
  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  void openDrawer() {
    drawerKey.currentState.openDrawer();
  }

  bool isOpen() {
    return drawerKey.currentState.isDrawerOpen;
  }
}
