import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageInputBox extends StatefulWidget {
  MessageInputBox({Key? key}) : super(key: key);

  @override
  State<MessageInputBox> createState() => _MessageInputBoxState();
}

class _MessageInputBoxState extends State<MessageInputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Chat message',
        ),
      ),
    );
  }
}
