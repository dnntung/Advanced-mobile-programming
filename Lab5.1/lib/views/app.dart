import 'package:flutter/material.dart';
import 'plan_creator_screen.dart';

class planner_demoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'planner_demo',
      home: Scaffold(
        body: PlanCreatorScreen(),
      ),
    );
  }
}
