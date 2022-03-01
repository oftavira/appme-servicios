import 'package:appme/constants/constants.dart';
import 'package:appme/nav_bar/nav_bar_responsive.dart';
import 'package:appme/utils/contact_info.dart';
import 'package:appme/views/sign_in_view/sign_in_widget.dart';
import 'package:appme/zone_app/content_navigator_widget.dart';
import 'package:flutter/material.dart';

class ContentWidget extends StatelessWidget {
  const ContentWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NavBar(),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          color: Black,
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Hero(
                tag: 'sign',
                child: SignInWidget(
                  key: Key('button'),
                  isButton: true,
                  height: 40,
                  width: 200,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Center(
              child: ContentNavigatorWidget(),
            ),
          ),
        ),
        Container(
          height: 30,
          child: Contact(),
        ),
      ],
    );
  }
}
