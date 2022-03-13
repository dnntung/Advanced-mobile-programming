import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/image.dart';

class ImageStream {
  List<ImageModel> imageList = [];

  fetchImages() {
    Uri url = Uri.parse("https://jsonplaceholder.typicode.com/photos");
    http.get(url).then((result) {
      var jsonArray = json.decode(result.body);
      imageList = List<ImageModel>.from(
          jsonArray.map((jsonObj) => ImageModel.fromJson(jsonObj)));
    });
  }

  ImageStream() {
    fetchImages();
  }

  Stream<ImageModel?> getImage() async* {
    yield* Stream.periodic(Duration(seconds: 5), (int t) {
      ImageModel? generatedImage;
      final _random = Random();
      if (imageList.length > 0) {
        generatedImage = imageList[_random.nextInt(imageList.length)];
      }

      return generatedImage;
    });
  }
}
