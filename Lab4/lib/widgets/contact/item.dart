import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  ContactItem({
    Key? key,
    required this.title,
    this.subtitle,
    this.avatarUrl,
    this.isActive,
    this.lastActive,
  }) : super(key: key);

  final String title;
  final String? subtitle;
  final String? avatarUrl;
  final bool? isActive;
  final String? lastActive;

  @override
  Widget build(BuildContext context) {
    Color badgeColor = Colors.transparent;
    if (isActive ?? false) {
      badgeColor = Colors.green;
    } else if (lastActive != null) {
      badgeColor = Colors.greenAccent.shade100;
    }

    // TODO: implement build
    return ListTile(
      leading: Badge(
        toAnimate: false,
        position: const BadgePosition(end: 0, bottom: 0),
        badgeColor: badgeColor,
        shape: lastActive != null ? BadgeShape.square : BadgeShape.circle,
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 2, color: Colors.black),
        padding: const EdgeInsets.all(4),
        showBadge: isActive != null || lastActive != null,
        badgeContent: lastActive != null
            ? Text(
                lastActive as String,
                style: TextStyle(fontSize: 7, fontWeight: FontWeight.bold),
              )
            : const SizedBox(
                width: 4,
                height: 4,
              ),
        child: CircleAvatar(
            radius: 18,
            backgroundImage: NetworkImage(avatarUrl ??
                "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/240120172_1018783688953234_6482622079438608942_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=aiLx1ymJy2wAX835e7D&_nc_ht=scontent.fsgn5-8.fna&oh=00_AT-R81wkKDob6y7i-RBO3PUl9y6qHnraYL9i-CWmU3yV3g&oe=623C1619")),
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle ?? "",
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            )
          : null,
      horizontalTitleGap: 8,
    );
  }
}
