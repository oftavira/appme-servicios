import 'package:appme/ui/base_widget.dart';
import 'package:appme/ui/ui_enum.dart';
import 'package:appme/views/courses_view/animated_course_widget.dart';
import 'package:flutter/material.dart';

class AvailableCourses extends StatefulWidget {
  final Map<String, Map> courses;
  final List mapKeys;
  const AvailableCourses(
      {Key key, @required this.courses, @required this.mapKeys})
      : super(key: key);

  @override
  _AvailableCoursesState createState() => _AvailableCoursesState();
}

class _AvailableCoursesState extends State<AvailableCourses>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return SizedWidget(
      theBuilder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.Mobile) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 110,
                child: Center(
                  child: AnimatedCourseWidget(
                      controller: _controller,
                      details: widget.courses[widget.mapKeys[index]],
                      mobile: true),
                ),
              );
            },
            separatorBuilder: (c, i) => SizedBox(
              height: 10,
            ),
            itemCount: widget.mapKeys.length,
          );
        } else {
          return ListView.separated(
            itemBuilder: (context, index) {
              return Container(
                height: 150,
                child: Center(
                  child: AnimatedCourseWidget(
                      controller: _controller,
                      details: widget.courses[widget.mapKeys[index]],
                      mobile: false),
                ),
              );
            },
            separatorBuilder: (c, i) => SizedBox(
              height: 10,
            ),
            itemCount: widget.mapKeys.length,
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
