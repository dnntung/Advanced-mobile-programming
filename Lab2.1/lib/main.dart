import 'package:flutter/material.dart';
import 'package:form_demo/components/my_custom_form.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: Container(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: const MyCustomForm()),
      ),
    );
  }
}
