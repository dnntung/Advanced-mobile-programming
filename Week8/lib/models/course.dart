class Course {
  String? title;
  String? description;
  String? shortDescription;
  String? owner;

  Course.fromJson(Map<String, dynamic> json) {
    title = json["entityTitle"];
    description = json["description"];
    owner = json["siteOwner"]["userDisplayName"];
  }

  @override
  String toString() {
    return '$title by $owner';
  }
}
