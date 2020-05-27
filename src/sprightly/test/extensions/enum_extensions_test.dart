import 'package:flutter_test/flutter_test.dart';
import 'package:sprightly/extensions/enum_extensions.dart';

void main() {
  group('Enums for Enum.values() test', () {
    // TODO:
    test('description', () {
      // act
      final result = _Dummy.values.toStrings();
    });
  }, skip: true);
  group('EnumExt test', () {
    // TODO:
  }, skip: true);
}

enum _Dummy { One, Two, Three }
enum _Days { Sun, Mon, Tues, Wed, Thu, Fri, Sat }
