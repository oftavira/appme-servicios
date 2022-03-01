import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: Route1());
  }
}

class Route1 extends StatefulWidget {
  const Route1({Key key}) : super(key: key);

  @override
  _Route1State createState() => _Route1State();
}

class _Route1State extends State<Route1> {
  bool isDefault;

  @override
  void initState() {
    isDefault = true;
    super.initState();
  }

  void get change => isDefault = !isDefault;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          change;
          setState(() {});
        },
      ),
      appBar: AppBar(
        title: Text('Material App Bar'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: AnimatedColors(isDefault: isDefault),
        ),
      ),
    );
  }
}

class AnimatedColors extends StatefulWidget {
  final bool isDefault;
  AnimatedColors({Key key, @required this.isDefault}) : super(key: key);

  @override
  _AnimatedColorsState createState() => _AnimatedColorsState();
}

class _AnimatedColorsState extends State<AnimatedColors> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: const Duration(seconds: 1),
        foregroundDecoration: BoxDecoration(
          color: widget.isDefault ? Colors.blue : Colors.red,
        ));
  }
}
