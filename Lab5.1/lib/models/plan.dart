// import '../repositories/repository.dart';
import 'package:planner_demo/repositories/repository.dart';
import 'package:flutter/foundation.dart';
import 'task.dart';

class Plan {
  int id = 0;
  String name = '';
  List<Task> tasks = [];

  Plan({required this.id, this.name = ''});

  Plan.fromModel(Model model) {
    id = model.id;
    name = model.data['name'] ?? '';
    if (model.data['tasks'] != null) {
      tasks = model.data['tasks']
          .map<Task>((task) => Task.fromModel(task))
          .toList();
    }
  }

  @override
  String toString() {
    return 'Plan_$id: $name ${tasks.map((task) => task.toString())}';
  }

  Model toModel() => Model(id: id, data: {
        'name': name,
        'tasks': tasks.map((task) => task.toModel()).toList()
      });

  int get completeCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completeCount out of ${tasks.length} tasks';
}
