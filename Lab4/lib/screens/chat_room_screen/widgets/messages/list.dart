import 'package:flutter/cupertino.dart';
import 'package:messenger_ui_clone/screens/chat_room_screen/widgets/messages/item.dart';

class MessageList extends StatefulWidget {
  MessageList({Key? key}) : super(key: key);

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final _messages = [
    {"userId": 1, "messageContent": "Knock knock"},
    {"userId": 2, "messageContent": "Who's there"},
    {"userId": 1, "messageContent": "Yoo"},
    {"userId": 2, "messageContent": "Yoo who?"},
    {"userId": 1, "messageContent": "Yoohoooooo"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      reverse: true,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: _messages.reversed
          .map((message) => MessageItem(data: message))
          .toList(),
    );
  }
}
