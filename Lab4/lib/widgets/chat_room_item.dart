import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoomItem extends StatelessWidget {
  const ChatRoomItem({
    Key? key,
    required this.title,
    required this.subtitle,
    this.avatarUrl,
    this.seen,
    this.isActive,
    this.didRead,
  }) : super(key: key);

  final String title, subtitle;
  final String? avatarUrl;
  final bool? seen;
  final bool? didRead;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    final bool isHighlight = !(didRead ?? false);

    // TODO: implement build
    return ListTile(
        leading: SizedBox(
          width: 36,
          height: 36,
          child: Stack(
            children: isActive ?? false
                ? [
                    CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrl ??
                            "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/240120172_1018783688953234_6482622079438608942_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=aiLx1ymJy2wAX835e7D&_nc_ht=scontent.fsgn5-8.fna&oh=00_AT-R81wkKDob6y7i-RBO3PUl9y6qHnraYL9i-CWmU3yV3g&oe=623C1619")),
                    Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1.5, color: Colors.black),
                                borderRadius: BorderRadius.circular(90.0),
                                color: Colors.green)))
                  ]
                : [
                    CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrl ??
                            "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/240120172_1018783688953234_6482622079438608942_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=aiLx1ymJy2wAX835e7D&_nc_ht=scontent.fsgn5-8.fna&oh=00_AT-R81wkKDob6y7i-RBO3PUl9y6qHnraYL9i-CWmU3yV3g&oe=623C1619")),
                  ],
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
              color: isHighlight ? Colors.white : Colors.grey[600],
              fontSize: 16,
              fontWeight: isHighlight ? FontWeight.bold : null),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
              color: isHighlight ? Colors.white : Colors.grey[600],
              fontSize: 14,
              fontWeight: isHighlight ? FontWeight.bold : null),
        ),
        trailing: Icon(
          (seen ?? false ? Icons.check_circle : Icons.check_circle_outline),
          size: 16,
          color: Colors.white.withOpacity(0.2),
        ));
  }
}
