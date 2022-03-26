import 'package:flutter/cupertino.dart';
import 'package:messenger_ui_clone/widgets/contact/item.dart';

class ContactList extends StatefulWidget {
  ContactList({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListState();
  }
}

class ListState extends State<ContactList> {
  List contacts = [
    {
      "title": "Nguyen Vinh",
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "isActive": true,
    },
    {
      "title": "Vũ 89kg tùn cạo đầu",
      "subtitle": "Nguyen, Vương and 2 others are active",
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "isActive": true
    },
    {
      "title": "Phú Thi",
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "isActive": true
    },
    {
      "title": "Việt Phương",
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "lastActive": "14m"
    },
    {
      "title": "Huỳnh Khôi",
      "avatarUrl": "https://dummyimage.com/300.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: contacts
            .map((contact) => ContactItem(
                  title: contact?["title"],
                  subtitle: contact?["subtitle"],
                  avatarUrl: contact?["avatarUrl"],
                  isActive: contact?["isActive"],
                ))
            .toList());
  }
}
