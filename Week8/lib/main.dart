import 'package:flutter/material.dart';
import 'package:xlms_API_demo/sakai_provider.dart';
import 'ui/courses_page.dart';
import 'ui/login_page.dart';

void main() {
  var sakaiProvider = SakaiProvider(child: const MyApp());
  runApp(sakaiProvider);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => LoginPage(),
        '/courses': (context) => Courses(),
      },
      initialRoute: '/',
    );
  }
}
