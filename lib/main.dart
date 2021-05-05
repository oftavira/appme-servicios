import 'package:appme/home_view.dart';
import 'package:appme/utils/opening_opacity.dart';
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
      home: MainAnimation(),
    );
  }
}

class MainAnimation extends StatelessWidget {
  const MainAnimation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpeningOpacity(
      child: SafeArea(
        child: HomeView(title: 'AppMe'),
      ),
    );
  }
}
