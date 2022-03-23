import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.title, this.actions}) : super(key: key);

  final String title;
  final List<Widget>? actions;
  static const avatarUrl =
      "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/240120172_1018783688953234_6482622079438608942_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=aiLx1ymJy2wAX835e7D&_nc_ht=scontent.fsgn5-8.fna&oh=00_AT-R81wkKDob6y7i-RBO3PUl9y6qHnraYL9i-CWmU3yV3g&oe=623C1619";

  _onAvatarTapped() {}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: AppBar(
          backgroundColor: Colors.black,
          toolbarHeight: 64,
          leading: IconButton(
              onPressed: _onAvatarTapped,
              icon: const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(avatarUrl),
              )),
          title: Text(title),
          titleTextStyle: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          titleSpacing: 0,
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Row(children: actions as List<Widget>),
            )
          ]),
    );
  }
}
