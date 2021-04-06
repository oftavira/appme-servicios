import 'package:appme/NavBar/appmedrawer.dart';
import 'package:appme/services/drawer_service.dart';
import 'package:appme/services/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:appme/NavBar/nav_bar_responsive.dart';
import 'package:appme/router/router.dart';
import 'package:appme/services/navigation_service.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:appme/ui/ui_enum.dart';

class HomeView extends StatelessWidget {
  final String title;
  const HomeView({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: locator<DrawerService>().drawerKey,
      drawerEnableOpenDragGesture: false,
      drawer: AppMeDrawer(),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Background(),
            EnsureFlutterFire(),
          ],
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
          return NavContent();
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class Background extends StatelessWidget {
  const Background({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (context, sizingInfo) {
        if (sizingInfo.deviceScreenType == DeviceScreenType.Mobile) {
          return Container(
            child: Image.asset(
              "assets/images/mobile_background.png",
              fit: BoxFit.cover,
            ),
          );
        } else {
          return Container(
            child: Image.asset(
              "assets/images/desktop_background.png",
              fit: BoxFit.cover,
            ),
          );
        }
      },
    );
  }
}

class NavContent extends StatelessWidget {
  const NavContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 40,
        ),
        // color: Colors.purple[100],
        constraints: BoxConstraints(
            minWidth: 50.0,
            minHeight: 50.0,
            maxWidth: 900.0,
            maxHeight: 1000.0),
        child: Column(
          children: [
            NavBar(),
            SizedBox(height: 10),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.center,
                child: Center(
                  child: NavigationSection(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavigationSection extends StatelessWidget {
  const NavigationSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: locator<NavigationService>().navigatorKey,
      onGenerateRoute: AppMeRouter.generateRoute,
      initialRoute: '/view1',
    );
  }
}
