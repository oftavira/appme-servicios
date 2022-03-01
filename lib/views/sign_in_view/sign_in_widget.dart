import 'package:appme/locator_services/app_navigator/app_navigator.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/ui/base_widget.dart';
import 'package:appme/utils/custom_text.dart';
import 'package:appme/zone_app_cubit/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInWidget extends StatefulWidget {
  final double width;
  final double height;
  final bool isButton;
  SignInWidget({Key key, @required this.isButton, this.width, this.height})
      : super(key: key);

  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  double width;
  double height;
  double opacity;

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (context, sizingInfo) {
        width = widget.width ?? (sizingInfo.mobile ? 300 : 450);
        height = widget.height ??
            (sizingInfo.mobile
                ? sizingInfo.screenSize.height - 80
                : sizingInfo.screenSize.height - 100);
        return GestureDetector(
          onTap: () {
            if (widget.isButton) {
              BlocProvider.of<ThemeCubit>(context).change();
              locator<AppNavigator>().navigateTo('/view2');
            }
          },
          child: MouseRegion(
            cursor: widget.isButton
                ? SystemMouseCursors.click
                : SystemMouseCursors.none,
            child: Container(
              width: width,
              height: height,
              decoration: widget.isButton
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue),
                    )
                  : BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: Colors.blue),
                    ),
              child: AnimatedOpacity(
                opacity: widget.isButton ? 1 : 0,
                duration: const Duration(milliseconds: 800),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: SignInButton(
                    forMobile: sizingInfo.mobile,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SignInButton extends StatelessWidget {
  final bool forMobile;
  const SignInButton({Key key, @required this.forMobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Icon(
          Icons.person_sharp,
          color: Colors.blue,
        ),
        CustomText(
          color: Colors.blue,
          fSize: forMobile ? 12 : 16,
          text: 'Ingresar',
        ),
      ],
    );
  }
}
