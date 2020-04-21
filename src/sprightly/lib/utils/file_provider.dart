import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

String get sqlAssetDirectory => 'assets/queries_min';

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

Future<String> getAssetText(String assetDirectory, String fileName) =>
    rootBundle.loadString(p.join(assetDirectory, fileName));

Future<String> getSqlQuery(String queryName) =>
    getAssetText(sqlAssetDirectory, '$queryName.sql');
