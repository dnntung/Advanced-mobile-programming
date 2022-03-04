import 'dart:convert';

String jsonRaw =
    '{ "id": 1, "url": "https://via.placeholder.com/600/92c952&quot;"}';

class ImageModel {
  // Null-aware
  int? id;
  String? url;

  ImageModel(this.id, this.url);

  ImageModel.fromJson(jsonObject) {
    id = jsonObject['id'];
    url = jsonObject['url'];
  }

  String toString() {
    return '($id, $url)';
  }
}

void main() {
  // print(jsonRaw);
  var jsonObject = json.decode(jsonRaw);

  // print(jsonObject['id']);
  // print(jsonObject['url']);

  // var image1 = ImageModel(jsonObject['id'], jsonObject['url']);
  var image2 = ImageModel.fromJson(jsonObject);
  print(image2);
}
