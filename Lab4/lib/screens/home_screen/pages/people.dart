import 'package:flutter/cupertino.dart';
import 'package:messenger_ui_clone/widgets/contact/list.dart';

class PeoplePage extends StatefulWidget {
  PeoplePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PageState();
  }
}

class PageState extends State<PeoplePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ContactList();
  }
}
