import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:messenger_ui_clone/widgets/active_contact_item.dart';

class ActiveContactList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ActiveContactListState();
  }
}

class ActiveContactListState extends State<ActiveContactList> {
  List contacts = [
    {
      "label": "Nguyen Vinh",
      "avatarUrl":
          "https://scontent.fsgn8-1.fna.fbcdn.net/v/t1.6435-1/117772122_1628957000610957_4535177878374732251_n.jpg?stp=c65.64.573.573a_dst-jpg_s100x100&_nc_cat=102&ccb=1-5&_nc_sid=7206a8&_nc_ohc=CXB4N-5L8mYAX-2DSUn&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn8-1.fna&oh=00_AT8T0w7kj3eJhURnqZfFDWry-1bclUIUbvNXCDIZU6c2wA&oe=626050D4",
    },
    {
      "label": "Phú Thi",
      "avatarUrl":
          "https://scontent.fsgn8-2.fna.fbcdn.net/v/t1.6435-1/150063756_2866848923636639_1512020516859123528_n.jpg?stp=dst-jpg_p100x100&_nc_cat=100&ccb=1-5&_nc_sid=7206a8&_nc_ohc=aDf2_TUiVSEAX-ZnXSa&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn8-2.fna&oh=00_AT_AtWsADkLup7p82ExDk1vnj-yyLH3VV2QQ2OnJrw772A&oe=62609C39",
    },
    {
      "label": "Việt Phương",
      "avatarUrl":
          "https://scontent.fsgn8-2.fna.fbcdn.net/v/t1.6435-1/202356886_1419522361730313_2007673927745043631_n.jpg?stp=dst-jpg_p100x100&_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_ohc=jytPmzvcQC4AX_vXNlv&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn8-2.fna&oh=00_AT9X2Gg66CnZP7j029gf9V5V7leoyNO1Wf0gkdifsYwKCg&oe=625FD49A",
    },
    {
      "label": "Huỳnh Khôi",
      "avatarUrl":
          "https://scontent.fsgn3-1.fna.fbcdn.net/v/t39.30808-1/275065191_997295441214032_789963114803147407_n.jpg?stp=dst-jpg_p100x100&_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_ohc=KUWjpd2SErUAX-OPLyt&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn3-1.fna&oh=00_AT9gBLjVroIUtTFb_Gld8QOyWm117mWvyhKkyx8NJGEVrA&oe=623DFD0D",
    },
    {
      "label": "Huỳnh Khôi",
      "avatarUrl":
          "https://scontent.fsgn3-1.fna.fbcdn.net/v/t39.30808-1/275065191_997295441214032_789963114803147407_n.jpg?stp=dst-jpg_p100x100&_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_ohc=KUWjpd2SErUAX-OPLyt&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn3-1.fna&oh=00_AT9gBLjVroIUtTFb_Gld8QOyWm117mWvyhKkyx8NJGEVrA&oe=623DFD0D",
    },
    {
      "label": "Huỳnh Khôi",
      "avatarUrl":
          "https://scontent.fsgn3-1.fna.fbcdn.net/v/t39.30808-1/275065191_997295441214032_789963114803147407_n.jpg?stp=dst-jpg_p100x100&_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_ohc=KUWjpd2SErUAX-OPLyt&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn3-1.fna&oh=00_AT9gBLjVroIUtTFb_Gld8QOyWm117mWvyhKkyx8NJGEVrA&oe=623DFD0D",
    },
    {
      "label": "Huỳnh Khôi",
      "avatarUrl":
          "https://scontent.fsgn3-1.fna.fbcdn.net/v/t39.30808-1/275065191_997295441214032_789963114803147407_n.jpg?stp=dst-jpg_p100x100&_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_ohc=KUWjpd2SErUAX-OPLyt&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn3-1.fna&oh=00_AT9gBLjVroIUtTFb_Gld8QOyWm117mWvyhKkyx8NJGEVrA&oe=623DFD0D",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
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
