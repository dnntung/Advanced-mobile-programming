import 'repository.dart';

class Db implements Repository {
  final _storage = <int, Model>{};

  @override
  Model create() {
    // Create new model object and save to storage
    final ids = _storage.keys.toList()..sort();

    final id = (ids.isEmpty) ? 1 : ids.last + 1;

    final model = Model(id: id);
    _storage[id] = model;
    return model;
  }

  @override
  Model? delete(int id) {
    // Remove model object with specific id
    return _storage.remove(id);
  }

  @override
  Model? get(int id) {
    // Get model object with specific id
    return _storage[id];
  }

  @override
  List<Model> getAll() {
    // Get saved model objects
    return _storage.values.toList(growable: false);
  }

  @override
  int update(Model item) {
    // Update model object in storage
    _storage.update(item.id, (value) => item);

    return 0;
  }

  @override
  void clear() {
    _storage.clear();
  }
}
