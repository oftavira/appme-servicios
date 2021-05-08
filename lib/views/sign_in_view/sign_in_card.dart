import 'package:appme/services/app_services_navigation.dart';
import 'package:appme/services/locator.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:appme/views/sign_in_view/transition_container.dart';
import 'package:flutter/material.dart';

class SignInCard extends StatelessWidget {
  final bool mobile;
  const SignInCard({Key key, @required this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (context, sizeInfo) {
        return Center(
          child: Container(
            width: mobile ? sizeInfo.screenSize.width - 100 : 300,
            child: Column(
              children: <Widget>[
                // TODO: Animate this behaviour
                Expanded(
                  flex: 1,
                  child: Container(
                    child: GestureDetector(
                      child: Container(
                        height: 40,
                        width: 100,
                        color: Colors.red,
                      ),
                      onTap: () {
                        locator<AppServicesNavigator>().navigateTo('/view1');
                      },
                    ),
                    color: Colors.pink.withOpacity(0.5),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Hero(
                    tag: 'sign',
                    child: TransitionContainer(),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
