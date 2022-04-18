import 'package:flutter_test/flutter_test.dart';

import 'package:string_util/string_util.dart';

void main() {
  final util = StringUtil();
  test('count word', () {
    expect(util.countWord("Nguyễn   Văn A"), 3);
  });

  test('remove accent', () {
    expect(util.removeAccent("Nguyễn Văn A"), "Nguyen Van A");
  });
}
