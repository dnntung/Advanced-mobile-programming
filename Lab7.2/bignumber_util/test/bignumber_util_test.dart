import 'package:flutter_test/flutter_test.dart';

import 'package:bignumber_util/bignumber_util.dart';

void main() {
  test('sum 2 string', () {
    final calculator = BigNumberUtil();
    expect(calculator.sum("1234", "892"), "2126");
  });
}
