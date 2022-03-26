import 'package:flutter/cupertino.dart';
import 'package:messenger_ui_clone/widgets/story/list.dart';

class StoriesPage extends StatefulWidget {
  StoriesPage({Key? key}) : super(key: key);

  @override
  State<StoriesPage> createState() => _StoriesPageState();
}

class _StoriesPageState extends State<StoriesPage> {
  @override
  Widget build(BuildContext context) {
    return StoryList();
  }
}
