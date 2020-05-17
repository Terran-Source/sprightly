import 'package:flutter_test/flutter_test.dart';
import 'package:sprightly/extensions/http_response_extensions.dart';

void main() {
  group('HttpHeaderParser test', () {
    // TODO:
    test('description', () {
      // arrange
      final headerValue =
          'type:attachment;filename="hello.txt";filename*="hello-world.txt";utf-8'; // Content-Disposition

      // act
      final result = headerValue.parseHeaderValue();
    });
  }, skip: true);
  group('HttpResponseExtension test', () {
    // TODO:
  }, skip: true);
}
