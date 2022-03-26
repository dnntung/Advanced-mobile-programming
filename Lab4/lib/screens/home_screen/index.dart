import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/screens/home_screen/pages/calls.dart';
import 'package:messenger_ui_clone/screens/home_screen/pages/chats.dart';
import 'package:messenger_ui_clone/screens/home_screen/pages/people.dart';
import 'package:messenger_ui_clone/screens/home_screen/pages/stories.dart';
import 'package:messenger_ui_clone/widgets/top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => ScreenState();
}

class ScreenState extends State<HomeScreen> {
  final _pages = [
    {
      "title": "Chats",
      "icon": Icons.chat_bubble,
      "content": Chats(),
      "badgeContent": 1,
      "actions": [
        Ink(
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Color.fromRGBO(36, 36, 37, 1),
          ),
          child: IconButton(
              splashColor: Colors.transparent,
              constraints: BoxConstraints(minHeight: 36, minWidth: 36),
              iconSize: 20,
              onPressed: () => {},
              icon: const Icon(Icons.camera_alt)),
        ),
        SizedBox(width: 8),
        Ink(
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Color.fromRGBO(36, 36, 37, 1),
          ),
          child: IconButton(
              splashColor: Colors.transparent,
              onPressed: () => {},
              iconSize: 20,
              constraints: BoxConstraints(minHeight: 36, minWidth: 36),
              icon: const Icon(Icons.edit)),
        )
      ],
    },
    {
      "title": "People",
      "icon": Icons.people,
      "content": PeoplePage(),
      "actions": [
        Ink(
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Color.fromRGBO(36, 36, 37, 1),
          ),
          child: IconButton(
              splashColor: Colors.transparent,
              onPressed: () => {},
              iconSize: 20,
              constraints: BoxConstraints(minHeight: 36, minWidth: 36),
              icon: const Icon(Icons.contacts)),
        )
      ],
      "badgeContent": 5,
      "badgeColor": Color(0xFF191919),
      "badgeTextColor": Colors.white54
    },
    {
      "title": "Stories",
      "icon": Icons.video_collection,
      "content": StoriesPage()
    },
  ];
  int _selectedIndex = 0;

  _onNavTap(index) => setState(() {
        _selectedIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: TopBar(
            title: _pages.elementAt(_selectedIndex)["title"] as String,
            actions: _pages.elementAt(_selectedIndex)["actions"] != null
                ? _pages.elementAt(_selectedIndex)["actions"] as List<Widget>
                : [],
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
                      showBadge: page["badgeContent"] != null,
                      child: Icon(page["icon"] as IconData),
                      badgeContent: page["badgeContent"] != null
                          ? Text(page["badgeContent"].toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: page["badgeTextColor"] != null
                                      ? page["badgeTextColor"] as Color
                                      : Colors.white))
                          : null,
                    ),
                    label: page["title"] as String,
                  ),
                )
                .toList()),
      ),
    );
  }
}
