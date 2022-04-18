import 'package:flutter/material.dart';
import 'package:food_list_demo/data_provider.dart';
import './views/app.dart';

main() {
  runApp(DataProvider(child: MyApp()));
}
