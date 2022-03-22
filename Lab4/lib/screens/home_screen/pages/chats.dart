import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/widgets/chat_room_list.dart';

class ChatsPage extends StatelessWidget {
  ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [Expanded(child: ChatRoomList())],
    );
  }
}
