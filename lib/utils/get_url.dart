import 'package:appme/services/locator.dart';
import 'package:appme/services/storage_service.dart';
import 'package:flutter/material.dart';

class GetUrl extends StatelessWidget {
  final String path;
  final Widget child;
  final Widget waiting;
  final Widget onError;
  const GetUrl({
    Key key,
    this.path,
    this.child,
    this.waiting,
    this.onError,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: locator<StorageService>().storage.ref(path).getDownloadURL(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return onError;
        } else if (snapshot.hasData) {
          return Container(
            child: child,
          );
        } else {
          return waiting;
        }
      },
    );
  }
}
