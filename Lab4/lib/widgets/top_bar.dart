import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({Key? key, required this.title, this.actions}) : super(key: key);

  final String title;
  final List<Widget>? actions;
  static const avatarUrl = "https://dummyimage.com/300.jpg";
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
