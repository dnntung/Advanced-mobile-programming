import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  final data;

  const MessageItem({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userId = data?["userId"];
    String messageContent = data?["messageContent"] ?? "";
    const me = 2;

    return Row(
      mainAxisAlignment:
          userId == me ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.only(bottom: 8),
          child: Text(messageContent,
              style: const TextStyle(fontSize: 16, color: Colors.white)),
        )
      ],
    );
  }
}
