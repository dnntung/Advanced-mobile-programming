import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/screens/chat_room_screen/widgets/message_input.dart';
import 'package:messenger_ui_clone/screens/chat_room_screen/widgets/messages/list.dart';

class ChatRoomScreen extends StatefulWidget {
  ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  final bool isOnline = true;
  _call() {
    print("Call btn clicked!");
  }

  _callVideo() {
    print("Video call btn clicked!");
  }

  _aboutRoom() {
    print("Open about chat room page...");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 64,
        backgroundColor: Colors.black,
        title: Row(children: [
          Badge(
            position: BadgePosition(bottom: 0, end: 0),
            showBadge: isOnline,
            badgeColor: Colors.green,
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://dummyimage.com/48.jpg"),
            ),
          ),
          const SizedBox(width: 8),
          Text("Jayce")
        ]),
        actions: [
          IconButton(onPressed: _call, icon: const Icon(Icons.phone)),
          IconButton(
            constraints: BoxConstraints(minWidth: 56),
            onPressed: _callVideo,
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.video_call),
                if (isOnline)
                  Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                        color: Colors.green, shape: BoxShape.circle),
                  )
              ],
            ),
          ),
          IconButton(
            onPressed: _aboutRoom,
            icon: const Icon(Icons.info),
          ),
        ],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: MessageList(),
          ),
          MessageInputBox()
        ],
      ),
    );
  }
}
