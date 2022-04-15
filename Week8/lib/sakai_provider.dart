import 'package:flutter/cupertino.dart';
import 'package:xlms_API_demo/sakai_services.dart';

var sakaiUrl = "https://xlms.myworkspace.vn";

class SakaiProvider extends InheritedWidget {
  SakaiProvider({Key? key, required this.child})
      : super(key: key, child: child);

  final Widget child;
  final service = SakaiService(sakaiUrl: sakaiUrl);

  static SakaiProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SakaiProvider>();
  }

  @override
  bool updateShouldNotify(SakaiProvider oldWidget) {
    return true;
  }
}
