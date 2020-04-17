import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<File> getFile(String filePath, [bool isSupportFile = false]) async {
  final targetDirectory = isSupportFile
      ? await getApplicationSupportDirectory()
      : await getApplicationDocumentsDirectory();
  return File(p.join(targetDirectory.path, filePath));
}

Future<File> appendText(String filePath, String text,
    [bool isSupportFile = false]) async {
  final targetDirectory = isSupportFile
      ? await getApplicationSupportDirectory()
      : await getApplicationDocumentsDirectory();
  var file = File(p.join(targetDirectory.path, filePath));
  if (file.existsSync()) {
    text = (await file.readAsString()) + text;
  }
  return file.writeAsString(text);
}
