import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/screens/chat_room_screen/index.dart';
import 'package:messenger_ui_clone/screens/home_screen/index.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'messenger_ui_clone',
        theme: ThemeData(
            primarySwatch: Colors.blue, backgroundColor: Colors.black),
        initialRoute: "/",
        routes: {
          "/": (ctx) => const HomeScreen(),
          "/chat": (ctx) => ChatRoomScreen(),
          "/call": (ctx) => const HomeScreen(),
        });
  }
}
