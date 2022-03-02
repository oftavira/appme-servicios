import 'package:cloud_firestore/cloud_firestore.dart';

class Cloud {
  static CollectionReference users =
      FirebaseFirestore.instance.collection('main');

  Future<void> addEvent(String section, String dev) {
    dynamic timeStamp = DateTime.now().toString();
    return users
        .add({
          timeStamp: section + ' ' + dev, // 42
        })
        .then((value) => print("Added time stamp"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
