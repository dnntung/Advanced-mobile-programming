// Create a Form widget.
import 'package:flutter/cupertino.dart';
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

  bool isEmail(value) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  bool isValidBirthYear(value) =>
      DateTime(value).isBefore(DateTime.now()) && value != DateTime.now().year;

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

              if (!isEmail(value)) {
                return 'Địa chỉ email không hợp lệ!';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "Địa chỉ email"),
          ),
          Row(children: [
            Flexible(
                child: TextFormField(
              decoration: const InputDecoration(hintText: "Họ và tên lót"),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vui lòng nhập họ và tên lót!';
                }
                return null;
              },
            )),
            const SizedBox(width: 16),
            Flexible(
                child: TextFormField(
              decoration: const InputDecoration(hintText: "Tên"),
            ))
          ]),
          TextFormField(
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập năm sinh';
              }

              if (!isValidBirthYear(int.parse(value))) {
                return 'Năm sinh không hợp lệ';
              }

              return null;
            },
            decoration: const InputDecoration(hintText: "Năm sinh"),
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Vui lòng nhập địa chỉ!';
              }
              return null;
            },
            decoration: const InputDecoration(hintText: "Địa chỉ"),
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
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
