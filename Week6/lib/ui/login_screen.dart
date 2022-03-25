import 'package:flutter/material.dart';
import '../validators/LoginValidator.dart';
import './stopwatch_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  @override
  State<StatefulWidget> createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<StatefulWidget> with LoginValidator {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: buildLoginForm(),
    );
  }

  Widget buildLoginForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [emailField(), passwordField(), loginButton()],
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      controller: emailController,
      decoration:
          InputDecoration(icon: Icon(Icons.person), labelText: 'Email address'),
      validator: validateEmail,
    );
  }

  Widget passwordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration:
          InputDecoration(icon: Icon(Icons.password), labelText: 'Password'),
      validator: validatePassword,
    );
  }

  Widget loginButton() {
    return ElevatedButton(onPressed: validate, child: Text('Login'));
  }

  void validate() {
    final form = formKey.currentState;
    if (!form!.validate()) {
      return;
    } else {
      final email = emailController.text;
      final password = passwordController.text;

      Navigator.of(context)
          .pushReplacementNamed(StopwatchScreen.route, arguments: email);
    }
  }
}
