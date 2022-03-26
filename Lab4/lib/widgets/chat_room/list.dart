import 'package:flutter/cupertino.dart';
import './item.dart';

class RoomList extends StatefulWidget {
  const RoomList({Key? key}) : super(key: key);

  @override
  State<RoomList> createState() => ListState();
}

class ListState extends State<RoomList> {
  List chatRooms = [
    {
      "title": "Nguyen Vinh",
      "subtitle": "Neva",
      "subtitle2": DateTime.now().toString(),
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "didRead": true,
      "isActive": true,
    },
    {
      "title": "Vũ 89kg tùn cạo đầu",
      "subtitle": "gonna",
      "subtitle2": DateTime.now().toString(),
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "isActive": true
    },
    {
      "title": "Phú Thi",
      "subtitle": "giv",
      "subtitle2": DateTime.now().toString(),
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "didRead": true,
      "isActive": true
    },
    {
      "title": "Việt Phương",
      "subtitle": "u",
      "subtitle2": DateTime.now().toString(),
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "didRead": true,
      "lastActive": "14m"
    },
    {
      "title": "Huỳnh Khôi",
      "subtitle": "up!",
      "subtitle2": DateTime.now().toString(),
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "didRead": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: chatRooms
            .map((room) => Room(
                title: room["title"],
                subtitle: room["subtitle"],
                subtitle2: room["subtitle2"],
                avatarUrl: room?["avatarUrl"],
                didRead: room?["didRead"],
                isActive: room?["isActive"],
                lastActive: room?["lastActive"]))
            .toList());
  }
}
