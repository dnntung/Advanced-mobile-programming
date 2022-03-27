import 'package:flutter/foundation.dart';

abstract class Repository {
  // Interface for the repository
  Model create();
  List<Model> getAll();

  Model? get(int id);

  int update(Model item);
  Model? delete(int id);
  void clear();
}

class Model {
  final int id;
  final Map data;

  const Model({required this.id, this.data = const {}});

  @override
  String toString() {
    return 'Model_$id: $data';
  }
}
