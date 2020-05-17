import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:sprightly/extensions/file_system_entity_extensions.dart';

void main() {
  group('FileSystemExtension test', () {
    test('basic test', () {
      // arrange
      final file = File('path/to/file/filename.ext'); // Content-Disposition

      // act
      final name = file.name;
      final basePath = file.basePath;

      // assert
      expect(name, 'filename.ext');
      expect(basePath, 'path/to/file');
    });
  });
}
