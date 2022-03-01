import 'package:appme/ui/base_widget.dart';
import 'package:appme/ui/sizing_information.dart';
import 'package:flutter/material.dart';

class LandingBackground extends StatelessWidget {
  const LandingBackground({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedWidget(
      theBuilder: (BuildContext context, SizingInformation sizeInfo) {
        double containerSize = sizeInfo.mobile ? 140 : 200;
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Container(),
                  ),
                  Image.asset(
                    'assets/courses/laundry500.png',
                    fit: BoxFit.contain,
                    height: containerSize,
                    width: containerSize,
                  ),
                  SizedBox(
                    width: sizeInfo.mobile ? 20 : 40,
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: sizeInfo.mobile ? 20 : 40,
                  ),
                  Image.asset(
                    'assets/courses/market500.png',
                    fit: BoxFit.contain,
                    height: containerSize,
                    width: containerSize,
                  ),
                  Expanded(
                    child: Container(),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
