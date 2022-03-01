import 'package:appme/locator_services/locator.dart';
import 'package:appme/utils/opening_opacity.dart';
import 'package:appme/zone_app/main_scaffold.dart';
import 'package:appme/zone_app_cubit/cubit/theme.dart';
import 'package:appme/zone_app_cubit/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(
        ThemeInfo(isDefault: true),
      ),
      child: MaterialApp(
        title: 'AppMe',
        theme: ThemeData(primarySwatch: Colors.grey),
        home: MainAnimation(),
      ),
    ); /*  */
  }
}

class MainAnimation extends StatelessWidget {
  const MainAnimation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpeningOpacity(
      child: SafeArea(
        child: MainScaffold(title: 'AppMe'),
      ),
    );
  }
}
