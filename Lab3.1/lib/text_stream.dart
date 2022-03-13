import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TextStream {
  List<String> textList = [];

  fetchText() {
    Uri url = Uri.parse("https://random-word-api.herokuapp.com/word?number=10");
    http.get(url).then((result) {
      var jsonObj = json.decode(result.body);
      textList = List<String>.from(jsonObj.map((w) => w));
    });
  }

  TextStream() {
    fetchText();
  }

  Stream<String?> getText() async* {
    yield* Stream.periodic(Duration(seconds: 5), (int t) {
      String? text;
      final _random = Random();
      if (textList.length > 0) {
        text = textList[_random.nextInt(textList.length)];
      }

      return text;
    });
  }
}
