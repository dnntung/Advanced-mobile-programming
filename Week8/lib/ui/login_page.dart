import 'package:flutter/material.dart';
import 'package:xlms_API_demo/sakai_provider.dart';
import '../sakai_services.dart';
import 'courses_page.dart';
import '../validation.dart';

class LoginPage extends StatefulWidget {
  static const route = '/';
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with CommonValidation {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final serverController =
      TextEditingController(text: "https://xlms.myworkspace.vn");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Trang đăng nhập'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                    icon: Icon(Icons.person),
                    labelText: 'Username',
                    hintText: 'username'),
                validator: validateUsername,
              ),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration(
                  icon: Icon(Icons.password),
                  labelText: 'Password',
                ),
                validator: validatePassword,
              ),
              TextFormField(
                controller: serverController,
                enabled: false,
                decoration: InputDecoration(
                  icon: Icon(Icons.link),
                  labelText: 'Server',
                ),
                validator: validateServer,
              ),
              Container(
                margin: EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.green, primary: Colors.white),
                    onPressed: validate,
                    child: Text('Đăng nhập')),
              )
            ],
          ),
        ),
      ),
    );
  }

  void validate() async {
    var _provider = SakaiProvider.of(context);
    var _service = _provider?.service;
    final form = formKey.currentState;
    if (!form!.validate()) {
      return;
    } else {
      final response = await _provider?.service
          .authenticate(emailController.text, passwordController.text);

      print(response?.body);

      if ((_service?.token ?? "") != "") {
        Navigator.of(context).pushNamed(Courses.route);
      }
    }
  }
}
