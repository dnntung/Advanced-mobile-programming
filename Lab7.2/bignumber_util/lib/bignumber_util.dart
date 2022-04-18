library bignumber_util;

/// A Calculator.
class BigNumberUtil {
  String sum(String str1, String str2) {
    // Before proceeding further, make sure length
    // of str2 is larger.
    if (str1.length > str2.length) {
      var t = str1;
      str1 = str2;
      str2 = t;
    }

    // Take an empty String for storing result
    String str = "";

    // Calculate length of both String
    int n1 = str1.length, n2 = str2.length;

    // Reverse both of Strings
    str1 = str1.split('').reversed.join();
    str2 = str2.split('').reversed.join();

    int carry = 0;
    for (var i = 0; i < n1; i++) {
      // Do school mathematics, compute sum of
      // current digits and carry
      var sum = ((str1.codeUnitAt(i) - '0'.codeUnitAt(0)) +
          (str2[i].codeUnitAt(0) - '0'.codeUnitAt(0)) +
          carry);
      str += String.fromCharCode(sum % 10 + '0'.codeUnitAt(0));

      // Calculate carry for next step
      carry = (sum / 10).floor();
    }

    // Add remaining digits of larger number
    for (var i = n1; i < n2; i++) {
      var sum = ((str2[i].codeUnitAt(0) - '0'.codeUnitAt(0)) + carry);
      str += String.fromCharCode(sum % 10 + '0'.codeUnitAt(0));
      carry = (sum / 10).floor();
    }

    // Add remaining carry
    if (carry > 0) {
      str += String.fromCharCode(carry + '0'.codeUnitAt(0));
    }

    // reverse resultant String
    str = str.split('').reversed.join();

    return str;
  }
}
