import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xlms_API_demo/models/course.dart';
import 'package:xlms_API_demo/sakai_provider.dart';
import '../sakai_services.dart';
import 'dart:convert';

class Courses extends StatefulWidget {
  static const route = '/courses';

  const Courses({Key? key}) : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  List<Course> courses = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Courses'),
        ),
        body: ListView(
          children: courses.map((c) => Text(c.toString())).toList(),
        ));
  }

  Future getCourses() async {
    var _provider = SakaiProvider.of(context);
    var _sakaiService = _provider?.service;

    final response = await _sakaiService?.getSites();

    if (response?.statusCode == 200 || response?.statusCode == 201) {
      setState(() {
        var jsonObj = json.decode(response?.body ?? "");
        if (jsonObj != null) {
          Iterable i = jsonObj["site_collection"];
          courses = List<Course>.from(i.map((model) => Course.fromJson(model)));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getCourses();
  }
}
