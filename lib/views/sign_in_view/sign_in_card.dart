import 'package:appme/locator_services/app_navigator/app_navigator.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:appme/views/sign_in_view/sign_in_widget.dart';
import 'package:appme/zone_app_cubit/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCard extends StatelessWidget {
  final bool mobile;
  const SignInCard({Key key, @required this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (context, sizeInfo) {
        return Container(
          width: mobile ? 300 : 400,
          child: Center(
            child: Stack(
              children: <Widget>[
                Center(
                  child: Hero(
                    tag: 'sign',
                    child: SignInWidget(
                      key: Key('background'),
                      isButton: false,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: (sizeInfo.mobile
                        ? sizeInfo.screenSize.height - 80
                        : sizeInfo.screenSize.height - 100),
                    width: (sizeInfo.mobile ? 300 : 450),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.blue),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          child: Container(
                            height: 40,
                            width: 100,
                            color: Colors.red,
                          ),
                          onTap: () {
                            BlocProvider.of<ThemeCubit>(context).change();
                            locator<AppNavigator>().navigateTo('/view1');
                          },
                        ),
                      ),
                    ),
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

// Column(
//               children: <Widget>[
//                 // TODO: Animate this behaviour
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     child: GestureDetector(
//                       child: Container(
//                         height: 40,
//                         width: 100,
//                         color: Colors.red,
//                       ),
//                       onTap: () {
//                         locator<AppServicesNavigator>().navigateTo('/view1');
//                       },
//                     ),
//                     color: Colors.pink.withOpacity(0.5),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Hero(
//                     tag: 'sign',
//                     child: TransitionContainer(),
//                   ),
//                 )
//               ],
//             ),