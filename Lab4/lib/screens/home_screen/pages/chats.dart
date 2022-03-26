import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/widgets/active_contact/list.dart'
    as active_contacts;
import 'package:messenger_ui_clone/widgets/chat_room/list.dart' as chat_rooms;

class Chats extends StatefulWidget {
  Chats({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ChatsPageState();
  }
}

class ChatsPageState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        active_contacts.HorizontalList(),
        Expanded(child: chat_rooms.RoomList()),
      ],
    );
  }
}
