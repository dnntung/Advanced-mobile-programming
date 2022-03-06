import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WordStream {
  List<String> wordList = [];

  fetchWords() {
    Uri url = Uri.parse("https://random-word-api.herokuapp.com/word?number=10");
    http.get(url).then((result) {
      var jsonObj = json.decode(result.body);
      wordList = List<String>.from(jsonObj.map((w) => w));
    });
  }

  WordStream() {
    fetchWords();
  }

  Stream<String?> getWord() async* {
    yield* Stream.periodic(Duration(seconds: 1), (int t) {
      String? generatedWord;
      final _random = Random();
      if (wordList.length > 0) {
        generatedWord = wordList[_random.nextInt(wordList.length)];
      }

      return generatedWord;
    });
  }
}
