import 'package:appme/locator_services/locator.dart';
import 'package:appme/utils/opening_opacity.dart';
import 'package:appme/zone_app/main_scaffold.dart';
import 'package:appme/zone_app_cubit/cubit/theme.dart';
import 'package:appme/zone_app_cubit/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  setUpLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isRandomTheme = true;
  ThemeData randomTheme;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeCubit>(
      create: (context) => ThemeCubit(
        ThemeInfo(isDefault: true),
      ),
      child: BlocBuilder<ThemeCubit, ThemeInfo>(
        builder: (context, info) {
          randomTheme = info.light();
          return MaterialApp(
            title: 'AppMe',
            theme: randomTheme,
            home: MainAnimation(),
          );
        },
      ),
    );
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
