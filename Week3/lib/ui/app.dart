import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/image_model.dart';
import 'dart:convert';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  // Start counter from 1 (no fetchable data with counter=0)
  int counter = 1;
  List<ImageModel> imageList = [];

  fetchImage() {
    print('Hi there! counter=$counter');

    Uri url = Uri.https('jsonplaceholder.typicode.com', 'photos/${counter}');
    // 'https://jsonplaceholder.typicode.com/photos/1';

    http.get(url).then((result) {
      var jsonRaw = result.body;
      var jsonObject = json.decode(jsonRaw);

      var imageModel = ImageModel.fromJson(jsonObject);

      // Add current model to list
      imageList.add(imageModel);

      // Change counter
      setState(() {
        counter++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var appWidget = new MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Image Viewer - v0.0.8'),
      ),
      // body: Text('Display list of images here. counter = $counter'),
      body: ListView.builder(
        itemCount: imageList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(8.0),
            // Prevent null value by using replace value
            child: Image.network(imageList[index].url ?? ""),
          );
        },
      ),
      floatingActionButton:
          FloatingActionButton(child: Icon(Icons.add), onPressed: fetchImage),
    ));

    return appWidget;
  }
}
