import 'package:flutter/material.dart';

class ArticlesView extends StatefulWidget {
  ArticlesView({Key key}) : super(key: key);

  @override
  State<ArticlesView> createState() => _ArticlesViewState();
}

class _ArticlesViewState extends State<ArticlesView>
    with TickerProviderStateMixin {
  AnimationController tcontroller;

  @override
  void initState() {
    tcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    tcontroller.forward();
    return Center(
      child: ListView.separated(
          itemBuilder: (c, i) => ShowColors(),
          separatorBuilder: (c, i) => SizedBox(height: 10),
          itemCount: 20),
    );
  }
}

class ShowColors extends StatelessWidget {
  final double h = 100;
  final double w = 30;
  const ShowColors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(height: h, width: w, color: Theme.of(context).primaryColor),
        Container(
            height: h, width: w, color: Theme.of(context).secondaryHeaderColor),
        Container(height: h, width: w, color: Theme.of(context).hintColor),
        Container(height: h, width: w, color: Theme.of(context).cardColor),
        Container(height: h, width: w, color: Theme.of(context).focusColor),
        Container(
            height: h, width: w, color: Theme.of(context).backgroundColor),
        Container(
            height: h, width: w, color: Theme.of(context).selectedRowColor),
        Container(
            height: h, width: w, color: Theme.of(context).bottomAppBarColor),
        Container(
            height: h, width: w, color: Theme.of(context).secondaryHeaderColor),
        Container(
            height: h,
            width: w,
            color: Theme.of(context).dialogBackgroundColor),
        Container(
            height: h,
            width: w,
            color: Theme.of(context).toggleableActiveColor),
        Container(
            height: h,
            width: w,
            color: Theme.of(context).unselectedWidgetColor),
      ],
    );
  }
}

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({Key key, this.controller})
      :
        // Each animation defined here transforms its value during the subset
        // of the controller's duration defined by the animation's interval.
        // For example the opacity animation transforms its value during
        // the first 10% of the controller's duration.

        eOpacity = Tween<double>(
          begin: 0.0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.900,
              1,
              curve: Curves.ease,
            ),
          ),
        ),
        opacity = Tween<double>(
          begin: 0.0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.0,
              0.100,
              curve: Curves.ease,
            ),
          ),
        ),
        width = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.100,
              0.300,
              curve: Curves.ease,
            ),
          ),
        ),
        height = Tween<double>(
          begin: 0.0,
          end: 100.0,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.300,
              0.600,
              curve: Curves.ease,
            ),
          ),
        ),
        padding = Tween<EdgeInsets>(
          begin: EdgeInsets.only(right: 10),
          end: EdgeInsets.only(left: 10),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.600,
              0.750,
              curve: Curves.ease,
            ),
          ),
        ),
        borderRadius = Tween<BorderRadius>(
          begin: BorderRadius.circular(0),
          end: BorderRadius.circular(35),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.750,
              0.850,
              curve: Curves.ease,
            ),
          ),
        ),
        color = ColorTween(
          begin: Colors.green,
          end: Colors.blue,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.850,
              0.950,
              curve: Curves.ease,
            ),
          ),
        ),

        // ... Other tween definitions ...

        super(key: key);

  final AnimationController controller;
  final Animation<double> opacity;
  final Animation<double> eOpacity;
  final Animation<double> width;
  final Animation<double> height;
  final Animation<EdgeInsets> padding;
  final Animation<BorderRadius> borderRadius;
  final Animation<Color> color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      child: Center(
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Container(
                color: Colors.green,
              ),
            ),
            Flexible(
              flex: 3,
              child: Text('Some text'),
            )
          ],
        ),
      ),
      builder: (context, child) {
        return Container(
          padding: padding.value,
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: opacity.value,
            child: Container(
              child: Opacity(
                opacity: eOpacity.value,
                child: child,
              ),
              width: 5 * width.value,
              height: height.value,
              decoration: BoxDecoration(
                color: color.value,
                border: Border.all(
                  color: Colors.indigo[300],
                  width: 3.0,
                ),
                borderRadius: borderRadius.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
