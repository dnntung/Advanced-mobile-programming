import 'package:flutter/cupertino.dart';
import 'package:messenger_ui_clone/widgets/story/item.dart';

class StoryList extends StatefulWidget {
  StoryList({Key? key}) : super(key: key);

  @override
  State<StoryList> createState() => _StoryListState();
}

class _StoryListState extends State<StoryList> {
  List stories = [
    {
      "title": "Your story",
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "backgroundUrl": "http://dummyimage.com/300x500.jpg",
      "didWatch": true
    },
    {
      "title": "Trương Nguyễn Thanh Nguyên",
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "backgroundUrl": "http://dummyimage.com/300x500.jpg"
    },
    {
      "title": "Cao Vương Minh",
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "backgroundUrl": "http://dummyimage.com/300x500.jpg"
    },
    {
      "title": "Vu Tran",
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "backgroundUrl": "http://dummyimage.com/300x500.jpg"
    },
    {
      "title": "Vương Gia Hào",
      "avatarUrl": "https://dummyimage.com/300.jpg",
      "backgroundUrl": "http://dummyimage.com/300x500.jpg"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 2 / 3,
            children: [
              StoryItem(
                isNotStory: true,
                title: "Add to story",
                backgroundUrl: "https://dummyimage.com/300.jpg",
              ),
              ...stories.map((story) => StoryItem(
                    didWatch: story?["didWatch"],
                    title: story["title"],
                    avatarUrl: story?["avatarUrl"],
                    backgroundUrl: story["backgroundUrl"],
                  )),
            ]));
  }
}
