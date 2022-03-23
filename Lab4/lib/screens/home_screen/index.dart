import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/screens/home_screen/pages/calls.dart';
import 'package:messenger_ui_clone/screens/home_screen/pages/chats.dart';
import 'package:messenger_ui_clone/screens/home_screen/pages/people.dart';
import 'package:messenger_ui_clone/widgets/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => ScreenState();
}

class ScreenState extends State<HomeScreen> {
  final _pages = [
    {"title": "Chats", "icon": Icons.chat_bubble, "content": Chats()},
    {"title": "Calls", "icon": Icons.video_call, "content": Calls()},
    {
      "title": "People",
      "icon": Icons.people,
      "content": People(),
      "badgeColor": Color(0xFF191919),
      "badgeTextColor": Colors.white54
    },
    {"title": "Stories", "icon": Icons.video_collection, "content": People()},
  ];
  int _selectedIndex = 0;

  _onNavTap(index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64),
        child: TopBar(
          title: _pages.elementAt(_selectedIndex)["title"] as String,
        ),
      ),
      body: _pages.elementAt(_selectedIndex)["content"] as Widget,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showUnselectedLabels: true,
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          selectedLabelStyle: const TextStyle(color: Colors.blue),
          currentIndex: _selectedIndex,
          onTap: _onNavTap,
          items: _pages
              .map(
                (page) => BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Badge(
                    badgeColor: page["badgeColor"] != null
                        ? page["badgeColor"] as Color
                        : Colors.red,
                    child: Icon(page["icon"] as IconData),
                    badgeContent: Text("2",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: page["badgeTextColor"] != null
                                ? page["badgeTextColor"] as Color
                                : Colors.white)),
                  ),
                  label: page["title"] as String,
                ),
              )
              .toList()),
    );
  }
}
