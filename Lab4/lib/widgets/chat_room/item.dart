import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Room extends StatelessWidget {
  const Room({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.subtitle2,
    this.avatarUrl,
    this.seen,
    this.isActive,
    this.didRead,
    this.lastActive,
  }) : super(key: key);

  final String title, subtitle, subtitle2;
  final String? avatarUrl;
  final bool? seen;
  final bool? didRead;
  final bool? isActive;
  final String? lastActive;

  @override
  Widget build(BuildContext context) {
    final bool isHighlight = !(didRead ?? false);
    Color badgeColor = Colors.transparent;
    if (isActive ?? false) {
      badgeColor = Colors.green;
    } else if (lastActive != null) {
      badgeColor = Colors.greenAccent.shade100;
    }

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
          leading: Badge(
            toAnimate: false,
            position: const BadgePosition(end: 0, bottom: 0),
            badgeColor: badgeColor,
            shape: lastActive != null ? BadgeShape.square : BadgeShape.circle,
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 2, color: Colors.black),
            showBadge: isActive != null || lastActive != null,
            badgeContent: lastActive != null
                ? Text(
                    lastActive as String,
                    style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
                  )
                : const SizedBox(
                    width: 5,
                    height: 5,
                  ),
            child: CircleAvatar(
                radius: 28,
                backgroundImage: NetworkImage(avatarUrl ??
                    "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/240120172_1018783688953234_6482622079438608942_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=aiLx1ymJy2wAX835e7D&_nc_ht=scontent.fsgn5-8.fna&oh=00_AT-R81wkKDob6y7i-RBO3PUl9y6qHnraYL9i-CWmU3yV3g&oe=623C1619")),
          ),
          title: Text(
            title,
            style: TextStyle(
                color: isHighlight ? Colors.white : Colors.grey[600],
                fontSize: 16,
                fontWeight: isHighlight ? FontWeight.bold : null),
          ),
          subtitle: Row(children: [
            _renderChatRoomContent(isHighlight),
            Text(
              " • ",
              style: TextStyle(
                  color: isHighlight ? Colors.white : Colors.grey[600],
                  fontSize: 14,
                  fontWeight: isHighlight ? FontWeight.bold : null),
            ),
            _renderChatRoomTime(isHighlight),
          ]),
          trailing: Icon(
            (seen ?? false ? Icons.check_circle : Icons.check_circle_outline),
            size: 16,
            color: Colors.white.withOpacity(0.2),
          )),
    );
  }

  Text _renderChatRoomTime(bool isHighlight) {
    return Text(
      subtitle2,
      style: TextStyle(
          color: isHighlight ? Colors.white : Colors.grey[600],
          fontSize: 14,
          fontWeight: isHighlight ? FontWeight.bold : null),
    );
  }

  Widget _renderChatRoomContent(bool isHighlight) {
    // https://stackoverflow.com/questions/51087681/flutter-two-text-in-a-row-with-left-one-overflowing-gracefully
    return Flexible(
      child: Text(
        subtitle,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: isHighlight ? Colors.white : Colors.grey[600],
            fontSize: 14,
            fontWeight: isHighlight ? FontWeight.bold : null),
      ),
    );
  }
}