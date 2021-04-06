import 'package:flutter/material.dart';

class ViewTree extends StatelessWidget {
  const ViewTree({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.blue,
      child: Text(
        'Esta es la tercera a recorrer',
        style: TextStyle(fontFamily: 'Poiret'),
      ),
    );
  }
}
