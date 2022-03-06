// Create a Form widget.
import 'package:flutter/material.dart';

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  bool isValidEmail(value) => value.contains("@") && value.contains(".");
  bool isValidBirthYear(int value) {
    return DateTime(value).isBefore(DateTime.now()) &&
        value != DateTime.now().year;
  }

  bool isDigit(String s, int index) =>
      "0".compareTo(s[index]) <= 0 && "9".compareTo(s[index]) >= 0;

  bool isValidPassword(String value) {
    bool hasUppercase = false;
    bool hasDigits = false;
    bool hasLowercase = false;
    bool hasSpecialCharacters =
        value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    bool hasValidLength = value.length >= 8;

    var character = '';
    var i = 0;
    while (i < value.length) {
      character = value.substring(i, i + 1);

      if (isDigit(character, 0)) {
        hasDigits = true;
      } else {
        if (character == character.toUpperCase()) {
          hasUppercase = true;
        }
        if (character == character.toLowerCase()) {
          hasLowercase = true;
        }
      }
      i++;
    }

    return hasUppercase &&
        hasDigits &&
        hasLowercase &&
        hasLowercase &&
        hasValidLength &&
        hasSpecialCharacters;
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập địa chỉ email!';
              }

              if (!isValidEmail(value)) {
                return 'Địa chỉ email không hợp lệ!';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "Địa chỉ email"),
          ),
          TextFormField(
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập địa chỉ!';
              }
              if (!isValidPassword(value)) {
                return 'Mật khẩu không hợp lệ!';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "Mật khẩu"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Form hợp lệ!')),
                  );
                }
              },
              child: const Text('Login'),
            ),
          ),
        ],
      ),
    );
  }
}
