mixin CommonValidation {
  String? validateUsername(String? value) {
    if (value!.isEmpty) {
      return 'please enter your username';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value!.isEmpty) {
      return 'please input your password';
    }
    return null;
  }

  String? validateServer(String? value) {
    if (value!.isEmpty) {
      return 'please input your server';
    }
    if (value != 'https://xlms.myworkspace.vn') {
      return 'Wrong server\n https://xlms.myworkspace.vn';
    }
    return null;
  }
}
