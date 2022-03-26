import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem(
      {Key? key,
      required this.backgroundUrl,
      required this.title,
      this.avatarUrl,
      this.didWatch,
      this.isNotStory})
      : super(key: key);

  final String backgroundUrl, title;
  final String? avatarUrl;
  final bool? didWatch, isNotStory;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          image: DecorationImage(
              image: NetworkImage(backgroundUrl), fit: BoxFit.cover),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              isNotStory ?? false
                  ? Icon(
                      Icons.add_circle,
                      color: Colors.white,
                      size: 48,
                    )
                  : SizedBox(
                      width: 48,
                      height: 48,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(backgroundUrl),
                      )),
              Text(title)
            ]));
  }
}
