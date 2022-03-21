import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  static const avatarUrl =
      "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/240120172_1018783688953234_6482622079438608942_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=aiLx1ymJy2wAX835e7D&_nc_ht=scontent.fsgn5-8.fna&oh=00_AT-R81wkKDob6y7i-RBO3PUl9y6qHnraYL9i-CWmU3yV3g&oe=623C1619";

  _onAvatarPressed() => {};

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text("Chats"),
          titleTextStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          toolbarHeight: 80,
          leading: IconButton(
              onPressed: _onAvatarPressed,
              icon: const CircleAvatar(
                backgroundImage: NetworkImage(avatarUrl),
              ))),
      body: Column(
        children: [],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        showUnselectedLabels: true,
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(color: Colors.blue),
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.transparent,
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call),
            label: 'Calls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Stories',
          ),
        ],
      ),
    );
  }
}
