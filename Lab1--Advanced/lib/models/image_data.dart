class ImageData {
  int? id;
  String? url;

  ImageData(this.id, this.url);

  ImageData.fromJson(jsonObject) {
    id = jsonObject['id'];
    url = jsonObject['url'];
  }

  String toString() {
    return '($id, $url)';
  }
}
