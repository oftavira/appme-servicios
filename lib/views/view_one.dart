import 'package:appme/constants/constants.dart';
import 'package:flutter/material.dart';

class ViewOne extends StatelessWidget {
  const ViewOne({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LandingContainer(),
    );
  }
}

class LandingContainer extends StatelessWidget {
  const LandingContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 10,
                ),
                Image.asset(
                  'assets/courses/laundry500.png',
                  fit: BoxFit.contain,
                  height: 300,
                  width: 300,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/courses/market500.png',
                  fit: BoxFit.contain,
                  height: 300,
                  width: 300,
                ),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ],
        )),
        Container(
          padding: EdgeInsets.all(20),
          color: Theme.of(context).hoverColor,
          child: Center(
            child: Text(
              "Pensado para ayudar a los negocios Mexicanos a mejorar su estrategia digital, ya sean micro, pequeños o medianos. El proyecto busca ayudar antes que obtener una ganancia, tu objetivo es primero, es por esto que hemos incluido planes de financiamiento y planes académicos que te permitiran aprender como se hacen los servicios que ofrecemos, así podrás optar por ser tu creador de contenido",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'BronovaR',
                fontSize: 20,
              ),
            ),
          ),
        )
      ],
    );
  }
}

// class ShakeCurve extends Curve {
//   @override
//   double transform(double t) => sin(t * pi * 2);
// }

/// This is the stateful widget that the main application instantiates.
// class JumpingSizeContainer extends StatefulWidget {
//   JumpingSizeContainer({Key key}) : super(key: key);

//   @override
//   _JumpingSizeContainerState createState() => _JumpingSizeContainerState();
// }

// /// This is the private State class that goes with JumpingSizeContainer.
// class _JumpingSizeContainerState extends State<JumpingSizeContainer> {
//   bool drawerIsOpen = false;

//   @override
//   Widget build(BuildContext context) {
//     return MouseRegion(
//       cursor: SystemMouseCursors.click,
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             drawerIsOpen = !drawerIsOpen;
//           });
//         },
//         child: AnimatedContainer(
//           width: drawerIsOpen ? 100 : 200,
//           height: drawerIsOpen ? 100 : 200,
//           color: drawerIsOpen ? Colors.orange : Colors.green,
//           alignment:
//               drawerIsOpen ? Alignment.center : AlignmentDirectional.topCenter,
//           duration: Duration(seconds: 2),
//           curve: Curves.elasticInOut,
//         ),
//       ),
//     );
//   }
// }
