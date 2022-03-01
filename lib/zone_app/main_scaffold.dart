import 'package:appme/locator_services/drawer/drawer_service.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/drawer/appmedrawer.dart';
import 'package:appme/utils/opening_opacity.dart';
import 'package:appme/zone_app/app_constrained_container.dart';
import 'package:appme/zone_app/app_navigator_widget.dart';
import 'package:appme/zone_app/animated_background.dart';
import 'package:appme/zone_app_cubit/cubit/theme.dart';
import 'package:appme/zone_app_cubit/cubit/theme_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScaffold extends StatelessWidget {
  final String title;
  const MainScaffold({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<ThemeCubit>(context).change();
        },
      ),
      key: locator<DrawerService>().drawerKey,
      drawerEnableOpenDragGesture: false,
      drawer: AppMeDrawer(),
      body: OpeningOpacity(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              AnimatedBackground(),
              EnsureFlutterFire(),
            ],
          ),
        ),
      ),
    );
  }
}

class EnsureFlutterFire extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Center(
            child: Container(
              color: Colors.blue,
              child: Text('ups! ocurrio un error, por favor inente mas tarde'),
            ),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return OpeningOpacity(
            child: AppConstrainedContainer(
              child: AppNavigatorWidget(
                heroController: HeroController(),
              ),
            ),
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return OpeningOpacity(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
