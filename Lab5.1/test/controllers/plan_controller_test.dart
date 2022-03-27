import 'package:flutter_test/flutter_test.dart';
import 'package:planner_demo/controllers/plan_controller.dart';

void main() {
  test('Test addNewPlan', () {
    var controller = PlanController();
    controller.addNewPlan('A');

    expect(1, controller.plans.length);
    expect('A', controller.plans.first.name);
  });

  test('Test addNewPlan with Vietnamese name', () {
    var controller = PlanController();
    controller.addNewPlan('Tạo ứng dụng Flutter tương tự như Tiki');

    expect(1, controller.plans.length);
    expect(
        'Tạo ứng dụng Flutter tương tự như Tiki', controller.plans.first.name);
  });
}
