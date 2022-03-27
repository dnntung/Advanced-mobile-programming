import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../lib/repositories/repository.dart';
import '../../lib/repositories/db.dart';

void main() {
  Repository repo = Db();
  test('Test InMemory Repository', () {
    expect(repo.getAll().isEmpty, true);

    Model newModel = repo.create();
    expect(newModel.id, 1);

    expect(repo.getAll().isEmpty, false);
    Model? existedModel = repo.get(1);

    expect(newModel, existedModel);

    Model newModel2 = repo.create();

    expect(repo.getAll().length, 2);
  });
  test('Test Model', () {
    Model newModel =
        Model(id: 3, data: {'task_name': 'Finish all assignments'});
    expect(newModel.id, 3);

    expect(newModel.data.isEmpty, false);

    expect(newModel.data['task_name'], 'Finish all assignments');
  });
}
