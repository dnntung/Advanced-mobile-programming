import 'package:flutter/cupertino.dart';
import 'package:messenger_ui_clone/widgets/chat_room_item.dart';

class ChatRoomList extends StatefulWidget {
  const ChatRoomList({Key? key}) : super(key: key);

  @override
  State<ChatRoomList> createState() => ChatRoomListState();
}

class ChatRoomListState extends State<ChatRoomList> {
  List chatRooms = [
    {
      "title": "Nguyen Vinh",
      "subtitle": "Neva",
      "avatarUrl":
          "https://scontent.fsgn8-1.fna.fbcdn.net/v/t1.6435-1/117772122_1628957000610957_4535177878374732251_n.jpg?stp=c65.64.573.573a_dst-jpg_s100x100&_nc_cat=102&ccb=1-5&_nc_sid=7206a8&_nc_ohc=CXB4N-5L8mYAX-2DSUn&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn8-1.fna&oh=00_AT8T0w7kj3eJhURnqZfFDWry-1bclUIUbvNXCDIZU6c2wA&oe=626050D4",
      "didRead": true,
      "isActive": true,
    },
    {
      "title": "Vũ 89kg tùn cạo đầu",
      "subtitle": "gonna",
      "avatarUrl":
          "https://scontent.fsgn3-1.fna.fbcdn.net/v/t1.15752-9/273908208_931027190934452_3454455799275653247_n.jpg?stp=dst-jpg_p100x100&_nc_cat=107&ccb=1-5&_nc_sid=4de414&_nc_ohc=PahuLjJKn0IAX_EVp3e&_nc_ht=scontent.fsgn3-1.fna&oh=03_AVK8cvV_Fl7ungCWOrz1weFPKYyWXvsqh1yVej-RXbfizA&oe=625F96EA",
      "isActive": true
    },
    {
      "title": "Phú Thi",
      "subtitle": "giv",
      "avatarUrl":
          "https://scontent.fsgn8-2.fna.fbcdn.net/v/t1.6435-1/150063756_2866848923636639_1512020516859123528_n.jpg?stp=dst-jpg_p100x100&_nc_cat=100&ccb=1-5&_nc_sid=7206a8&_nc_ohc=aDf2_TUiVSEAX-ZnXSa&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn8-2.fna&oh=00_AT_AtWsADkLup7p82ExDk1vnj-yyLH3VV2QQ2OnJrw772A&oe=62609C39",
      "didRead": true,
      "isActive": true
    },
    {
      "title": "Việt Phương",
      "subtitle": "u",
      "avatarUrl":
          "https://scontent.fsgn8-2.fna.fbcdn.net/v/t1.6435-1/202356886_1419522361730313_2007673927745043631_n.jpg?stp=dst-jpg_p100x100&_nc_cat=105&ccb=1-5&_nc_sid=7206a8&_nc_ohc=jytPmzvcQC4AX_vXNlv&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn8-2.fna&oh=00_AT9X2Gg66CnZP7j029gf9V5V7leoyNO1Wf0gkdifsYwKCg&oe=625FD49A",
      "didRead": true
    },
    {
      "title": "Huỳnh Khôi",
      "subtitle": "up!",
      "avatarUrl":
          "https://scontent.fsgn3-1.fna.fbcdn.net/v/t39.30808-1/275065191_997295441214032_789963114803147407_n.jpg?stp=dst-jpg_p100x100&_nc_cat=107&ccb=1-5&_nc_sid=7206a8&_nc_ohc=KUWjpd2SErUAX-OPLyt&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.fsgn3-1.fna&oh=00_AT9gBLjVroIUtTFb_Gld8QOyWm117mWvyhKkyx8NJGEVrA&oe=623DFD0D",
      "didRead": true
    },
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
        children: chatRooms
            .map((room) => ChatRoomItem(
                  title: room?["title"],
                  subtitle: room?["subtitle"],
                  avatarUrl: room?["avatarUrl"],
                  didRead: room?["didRead"],
                  isActive: room?["isActive"],
                ))
            .toList());
  }
}
