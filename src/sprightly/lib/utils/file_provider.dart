import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

Future<Directory> getDirectory(String path,
    {bool isSupportDirectory = false}) async {
  var targetDirectory = isSupportDirectory
      ? await getApplicationSupportDirectory()
      : await getApplicationDocumentsDirectory();
  return Directory(p.join(targetDirectory.path, path));
}

Future<File> getFile(String filePath,
    {bool isSupportFile = false, bool recreateFile = false}) async {
  final targetDirectory = isSupportFile
      ? await getApplicationSupportDirectory()
      : await getApplicationDocumentsDirectory();
  var file = File(p.join(targetDirectory.path, filePath));
  if (recreateFile && await file.exists()) await file.delete();
  return file;
}

Future<String> getFileText(String filePath,
    {bool isSupportFile = false}) async {
  var file = await getFile(filePath, isSupportFile: isSupportFile);
  if (await file.exists()) return await file.readAsString();
  return null;
}

Future<File> saveTextFile(
  String filePath,
  String text, {
  FileMode mode = FileMode.writeOnly,
  bool isSupportFile = false,
}) async {
  var file = await getFile(filePath, isSupportFile: isSupportFile);
  return file.writeAsString(text, mode: mode, flush: true);
}

Future<File> appendTextToFile(
  String filePath,
  String text, {
  bool isSupportFile = false,
}) =>
    saveTextFile(filePath, text,
        mode: FileMode.writeOnlyAppend, isSupportFile: isSupportFile);

Future<File> saveFileAsBytes(
  String filePath,
  Uint8List fileContent, {
  FileMode mode = FileMode.writeOnly,
  bool isSupportFile = false,
}) async {
  var file = await getFile(filePath, isSupportFile: isSupportFile);
  return file.writeAsBytes(fileContent, mode: mode, flush: true);
}

Future<File> appendBytesToFile(String filePath, Uint8List fileContent,
        {bool isSupportFile = false}) =>
    saveFileAsBytes(filePath, fileContent,
        mode: FileMode.writeOnlyAppend, isSupportFile: isSupportFile);

// Future<File> cacheRemoteFile(String fileUri,
//         {Map<String, String> headers,
//         String cacheRelativePath,
//         bool isSupportFile = false}) =>
//     null;

Future<String> getAssetText(
  String fileName, {
  String assetDirectory,
  String extension,
}) =>
    rootBundle.loadString(
        p.join(assetDirectory ?? '', '$fileName${extension ?? ''}'));

Future<Uint8List> getAssetBytes(
  String fileName, {
  String assetDirectory,
  String extension,
}) async =>
    (await rootBundle
            .load(p.join(assetDirectory ?? '', '$fileName${extension ?? ''}')))
        .buffer
        .asUint8List();

class DirectoryInfo {}

class RemoteFileCache {
  final String _cacheDirectory = '__fileCache';
  final String _cacheFile = '__fileCache.json';
  final Map<String, String> _fileCache = {};

  static RemoteFileCache _cache = RemoteFileCache._();
  RemoteFileCache._() {
    _init();
  }
  factory RemoteFileCache() => _cache;

  bool initialized = false;
  bool _working = false;
  Future<void> _init() async {
    if (!initialized && !_working) {
      _working = true;
      var cacheDirectory = await getDirectory(_cacheDirectory);
      if (await cacheDirectory.exists()) {
        var oldFileCache =
            await getFileText(p.join(_cacheDirectory, _cacheFile));
        if (null != oldFileCache) _fileCache.addAll(json.decode(oldFileCache));
      } else
        await cacheDirectory.create(recursive: true);
      initialized = true;
      _working = false;
    }
  }

  /// to be called before application ends,
  /// or else, any changes after last [dump] will be lost
  Future<void> dump() => saveTextFile(
      p.join(_cacheDirectory, _cacheFile), json.encode(_fileCache));
}
