import 'dart:convert';
import 'package:flutter/services.dart';

class JsonReader {
  JsonReader._internal();

  factory JsonReader() {
    return JsonReader._internal();
  }

  Future<Map> jsonContent(path) async {
    String content = await _preContent(path);
    Future<Map> map = jsonDecode(content);
    return map;
  }

  //PATH "assets/quiz.json"

  Future<String> _preContent(path) async {
    String ref = await rootBundle.loadString(path);
    return ref;
  }
}
