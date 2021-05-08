import 'package:flutter/material.dart';

class OpeningOpacity extends StatefulWidget {
  final Widget child;
  OpeningOpacity({Key key, @required this.child}) : super(key: key);

  @override
  _OpeningOpacityState createState() => _OpeningOpacityState();
}

class _OpeningOpacityState extends State<OpeningOpacity>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return AnimatedBuilder(
      animation: _controller,
      child: widget.child,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: _animation,
          child: child,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
