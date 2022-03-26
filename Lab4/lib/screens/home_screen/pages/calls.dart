import 'package:flutter/cupertino.dart';
import 'package:messenger_ui_clone/widgets/chat_room/list.dart' as chat_rooms;

class Calls extends StatefulWidget {
  const Calls({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CallsPageState();
  }
}

class CallsPageState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [Expanded(child: chat_rooms.RoomList())],
    );
  }
}
