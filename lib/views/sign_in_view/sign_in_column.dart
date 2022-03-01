import 'package:flutter/material.dart';

class SignInColumn extends StatelessWidget {
  const SignInColumn({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Icon(Icons.person_pin, size: 100),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 40,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          height: 40,
        )
      ],
    );
  }
}
