import 'package:appme/locator_services/json/jsonreader.dart';
import 'package:appme/locator_services/locator.dart';
import 'package:appme/utils/custom_text.dart';
import 'package:flutter/material.dart';

class AsyncList extends StatelessWidget {
  final String path;
  final String mapKey;
  final double fontSize;
  const AsyncList({
    Key key,
    this.path,
    this.mapKey,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: locator<JsonReader>().jsonContent(path),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          Map<String, dynamic> data = snapshot.data;
          List<String> services = data[mapKey];
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (_, i) => SizedBox(height: 10),
            itemCount: services.length,
            itemBuilder: (_, i) => CustomText(
              text: services[i],
            ),
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
