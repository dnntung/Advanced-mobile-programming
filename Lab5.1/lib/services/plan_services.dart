// Use relative path: NOK
// import '../repositories/repository.dart';
import 'package:planner_demo/repositories/repository.dart';
import '../models/task.dart';
import '../models/plan.dart';
// Use relative path: NOK
import 'package:planner_demo/repositories/db.dart';

class PlanServices {
  Repository _repository = Db();

  Plan createPlan(String name) {
    final model = _repository.create();
    final plan = Plan.fromModel(model)..name = name;
    savePlan(plan);
    return plan;
  }

  void savePlan(Plan plan) {
    print(plan.toString());
    _repository.update(plan.toModel());
  }

  void delete(Plan plan) {
    _repository.delete(plan.toModel().id);
  }

  List<Plan> getAllPlans() {
    return _repository.getAll().map<Plan>((model) {
      Plan plan = Plan.fromModel(model);
      return plan;
    }).toList();
  }

  void addTask(Plan plan, String description) {
    // final id = plan.tasks.last?.id ?? 0 + 1;
    final id = (plan.tasks.isNotEmpty) ? plan.tasks.last.id : 1;
    final task = Task(id: id, description: description);
    plan.tasks.add(task);
    savePlan(plan);
  }

  void deleteTask(Plan plan, Task task) {
    plan.tasks.remove(task);
    savePlan(plan);
  }
}
