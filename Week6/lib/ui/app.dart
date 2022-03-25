import 'package:flutter/material.dart';
import './login_screen.dart';
import './stopwatch_screen.dart';

class StopwatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginScreen(),
        '/login': (context) => LoginScreen(),
        StopwatchScreen.route: (context) => StopwatchScreen()
      },
      initialRoute: '/',
    );
  }

}
