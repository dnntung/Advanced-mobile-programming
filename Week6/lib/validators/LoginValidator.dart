mixin LoginValidator {
  String? validateEmail(String? email) {
    if (email!.isEmpty) {
      return 'Email address is required.';
    }

    final regex = RegExp('[^@]+@[^\.]+\..+');
    if (!regex.hasMatch(email)) {
      return 'Enter a valid email';
    }

    return null;
  }

  String? validatePassword(String? password) {
    if (password!.length < 4) {
      return 'Length of password must be above 4.';
    }
  }
}