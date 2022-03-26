import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './item.dart';

class HorizontalList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListState();
  }
}

class ListState extends State<HorizontalList> {
  List contacts = [
    {"label": "Nguyen Vinh", "avatarUrl": "https://dummyimage.com/300.jpg"},
    {
      "label": "Phú Thi",
      "avatarUrl": "https://dummyimage.com/300.jpg",
    },
    {
      "label": "Việt Phương",
      "avatarUrl": "https://dummyimage.com/300.jpg",
    },
    {"label": "Huỳnh Khôi", "avatarUrl": "https://dummyimage.com/300.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      height: 96,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ActiveContactItem(label: "Create room", icon: Icons.video_call),
          ...contacts
              .map((contact) => ActiveContactItem(
                    label: contact?["label"],
                    avatarUrl: contact?["avatarUrl"],
                  ))
              .toList()
        ],
      ),
    );
  }
}
