import 'package:appme/locator_services/json/jsonreader.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/utils/custom_text.dart';
import 'package:flutter/material.dart';

class AsyncText extends StatelessWidget {
  final String path;
  final String mapKey;
  final double fontSize;
  const AsyncText({
    Key key,
    this.path,
    this.mapKey,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, String>>(
      future: locator<JsonReader>().jsonContent(path),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Map<String, String> data = snapshot.data;
          return CustomText(
            text: data[mapKey],
          );
        } else if (snapshot.hasError) {
          return CustomText(
            text: 'Parece que hubo un problema :s',
            fSize: fontSize,
          );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}
