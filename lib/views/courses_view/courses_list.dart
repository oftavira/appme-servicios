import 'package:appme/locator_services/json/jsonreader.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/views/courses_view/available_courses.dart';
import 'package:flutter/material.dart';

class CoursesList extends StatelessWidget {
  const CoursesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map>(
        future: locator<JsonReader>().jsonContent('assets/info/courses.json'),
        builder: (context, mapSnapshot) {
          if (mapSnapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.black,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (mapSnapshot.hasData) {
            Map data = mapSnapshot.data;
            return AvailableCourses(
              courses: data,
              mapKeys: data.keys.toList(),
            );
          } else if (mapSnapshot.hasError) {
            return Container(
              child: Text(
                mapSnapshot.error.toString(),
              ),
            );
          } else {
            return Container(
              child: Text('Something went wrong :('),
            );
          }
        });
  }
}
