import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActiveContactItem extends StatelessWidget {
  ActiveContactItem({Key? key, required this.label, this.avatarUrl, this.icon})
      : super(key: key);

  final String label;
  final String? avatarUrl;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 56,
      margin: EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Column(
        children: [
          Badge(
              toAnimate: false,
              position: const BadgePosition(end: 0, bottom: 0),
              badgeColor: Colors.green,
              shape: BadgeShape.circle,
              borderRadius: BorderRadius.circular(8),
              showBadge: icon == null,
              borderSide: const BorderSide(width: 2, color: Colors.black),
              padding: const EdgeInsets.all(8),
              child: CircleAvatar(
                radius: 28,
                child: icon != null ? Icon(icon, size: 32,) : null,
                foregroundColor: Colors.white,
                backgroundColor: Colors.white.withOpacity(0.2),
                backgroundImage: icon == null
                    ? NetworkImage(avatarUrl ??
                    "https://scontent.fsgn5-8.fna.fbcdn.net/v/t39.30808-6/240120172_1018783688953234_6482622079438608942_n.jpg?_nc_cat=109&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=aiLx1ymJy2wAX835e7D&_nc_ht=scontent.fsgn5-8.fna&oh=00_AT-R81wkKDob6y7i-RBO3PUl9y6qHnraYL9i-CWmU3yV3g&oe=623C1619")
                    : null,
              )),
          const SizedBox(
            height: 8,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 14),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
