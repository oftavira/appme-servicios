import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: ListView.separated(
              itemBuilder: (c, i) => FadedContainer(controller),
              separatorBuilder: (c, i) => SizedBox(
                    height: 10,
                  ),
              itemCount: 20),
        ),
      ),
    );
  }
}

class FadedContainer extends StatelessWidget {
  final AnimationController controller;
  final Animation<double> opacity;
  FadedContainer(this.controller, {Key key})
      : opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        child: Container(
            height: 100,
            width: 100,
            color: const Color.fromARGB(255, 226, 154, 217)),
        builder: (context, child) {
          return Opacity(
            opacity: controller.value,
            child: child,
          );
        });
  }
}
