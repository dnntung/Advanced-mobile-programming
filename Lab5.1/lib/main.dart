import 'package:flutter/material.dart';
import 'package:planner_demo/plan_provider.dart';
import 'views/app.dart';
import 'plan_provider.dart';

void main() {
  var planProvider = PlanProvider(child: planner_demoApp());
  runApp(planProvider);
}
