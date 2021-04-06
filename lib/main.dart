import 'package:appme/main_content.dart';
import 'package:flutter/material.dart';
import 'package:appme/services/locator.dart';

void main() {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppMe',
      theme: ThemeData(primarySwatch: Colors.grey),
      home: SafeArea(child: HomeView(title: 'AppMe')),
    );
  }
}
