import 'package:appme/NavBar/appmedrawer.dart';
import 'package:appme/app_container.dart';
import 'package:appme/background_decoration.dart';
import 'package:appme/services/drawer_service.dart';
import 'package:appme/services/locator.dart';
import 'package:appme/utils/opening_opacity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final String title;
  const HomeView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: locator<DrawerService>().drawerKey,
      drawerEnableOpenDragGesture: false,
      drawer: AppMeDrawer(),
      body: OpeningOpacity(
        child: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Background(),
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
            child: NavContent(),
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
