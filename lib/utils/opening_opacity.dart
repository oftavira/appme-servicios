import 'package:flutter/material.dart';

class OpeningOpacity extends StatefulWidget {
  final Widget child;
  final double currentOpacity;
  OpeningOpacity({Key key, @required this.child, this.currentOpacity = 1})
      : super(key: key);

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
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0, end: widget.currentOpacity).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return FadeTransition(
      opacity: _animation,
      child: widget.child,
    );
  }
}
