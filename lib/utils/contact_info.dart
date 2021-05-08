import 'package:appme/utils/custom_text.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({Key key}) : super(key: key);

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Alignment> alignmentTween;
  Animation<double> opacity;
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
    );

    alignmentTween = AlignmentTween(
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.6,
          0.8,
          curve: Curves.easeInOut,
        ),
      ),
    );

    opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.8,
          1,
          curve: Curves.easeInOut,
        ),
      ),
    );

    // opacity = _controller.drive(
    //   Tween<double>(begin: 0, end: 1),
    // );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return AlignTransition(
      alignment: alignmentTween,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue,
          ),
          color: Colors.black,
        ),
        child: AnimatedBuilder(
          animation: _controller,
          child: CustomText(
            text: ' WhatsApp : 777 272 86 40 ',
          ),
          builder: (BuildContext context, Widget child) {
            return FadeTransition(
              opacity: opacity,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
