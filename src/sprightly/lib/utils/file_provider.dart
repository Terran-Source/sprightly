import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sprightly/extensions/file_system_entity_extensions.dart';

Future<String> getAbsolutePath(
  String path, {
  bool isSupportDirectory = false,
  bool isAbsolute = false,
}) async {
  var targetDirectory = isAbsolute
      ? ''
      : (isSupportDirectory
              ? await getApplicationSupportDirectory()
              : await getApplicationDocumentsDirectory())
          .path;
  return p.join(targetDirectory, path);
}

Future<Directory> getDirectory(
  String path, {
  bool isSupportDirectory = false,
  bool isAbsolute = false,
}) async =>
    Directory(await getAbsolutePath(path,
        isSupportDirectory: isSupportDirectory, isAbsolute: isAbsolute));

Future<File> getFile(
  String filePath, {
  bool isSupportFile = false,
  bool recreateFile = false,
  bool isAbsolute = false,
}) async {
  var file = File(await getAbsolutePath(filePath,
      isSupportDirectory: isSupportFile, isAbsolute: isAbsolute));
  if (recreateFile && await file.exists()) await file.delete();
  return file;
}

Future<String> getFileText(
  String filePath, {
  bool isSupportFile = false,
  bool isAbsolute = false,
}) async {
  var file = await getFile(filePath,
      isSupportFile: isSupportFile, isAbsolute: isAbsolute);
  if (await file.exists()) return await file.readAsString();
  return null;
}

Future<File> saveTextFile(
  String filePath,
  String text, {
  FileMode mode = FileMode.writeOnly,
  bool isSupportFile = false,
  bool isAbsolute = false,
}) async {
  var file = await getFile(filePath,
      isSupportFile: isSupportFile, isAbsolute: isAbsolute);
  return file.writeAsString(text, mode: mode, flush: true);
}

Future<File> appendTextToFile(
  String filePath,
  String text, {
  bool isSupportFile = false,
  bool isAbsolute = false,
}) =>
    saveTextFile(filePath, text,
        mode: FileMode.writeOnlyAppend,
        isSupportFile: isSupportFile,
        isAbsolute: isAbsolute);

Future<File> saveFileAsBytes(
  String filePath,
  Uint8List fileContent, {
  FileMode mode = FileMode.writeOnly,
  bool isSupportFile = false,
  bool isAbsolute = false,
}) async {
  var file = await getFile(filePath,
      isSupportFile: isSupportFile, isAbsolute: isAbsolute);
  return file.writeAsBytes(fileContent, mode: mode, flush: true);
}

Future<File> appendBytesToFile(
  String filePath,
  Uint8List fileContent, {
  bool isSupportFile = false,
  bool isAbsolute = false,
}) =>
    saveFileAsBytes(filePath, fileContent,
        mode: FileMode.writeOnlyAppend,
        isSupportFile: isSupportFile,
        isAbsolute: isAbsolute);

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

class _DirectoryCleanUp {
  final DirectoryInfo directoryInfo;
  final Map<String, String> cache;

  _DirectoryCleanUp(this.directoryInfo, this.cache);
}

class DirectoryInfo {
  final Directory current;
  Stream<FileSystemEntity> contents;
  List<DirectoryInfo> directories = [];
  List<File> files = [];

  static Future<DirectoryInfo> readDirectory(Directory directory) async {
    var directoryInfo = DirectoryInfo(directory);
    directoryInfo.contents = directory.list();
    await for (var content in directoryInfo.contents) {
      if (content is File)
        directoryInfo.files.add(content);
      else if (content is Directory)
        directoryInfo.directories.add(await compute(readDirectory, content));
    }
    return directoryInfo;
  }

  static Future<void> cleanUp(_DirectoryCleanUp target) async {
    target.directoryInfo?.files
        ?.where((file) => !target.cache.containsValue(file.path))
        ?.forEach((file) async => await file.delete());
    target.directoryInfo?.directories?.forEach((dir) async {
      if (dir.isEmpty)
        await dir.current.delete();
      else
        await cleanUp(_DirectoryCleanUp(dir, target.cache));
    });
  }

  DirectoryInfo(this.current);

  String get name => current.name;
  bool get isEmpty => files.length == 0 && directories.length == 0;
}

class RemoteFileCache {
  final String _cacheDirectory = '__fileCache';
  final String _cacheFile = '__fileCache.json';
  final Map<String, String> _fileCache = {};

  DirectoryInfo _directoryInfo;
  DirectoryInfo get directoryInfo => _directoryInfo;

  static RemoteFileCache current = RemoteFileCache();

  bool initialized = false;
  bool _working = false;

  Future<void> init() async {
    if (!initialized && !_working) {
      _working = true;
      var cacheDirectory = await getDirectory(_cacheDirectory);
      if (await cacheDirectory.exists()) {
        var oldFileCache =
            await getFileText(p.join(_cacheDirectory, _cacheFile));
        if (null != oldFileCache) _fileCache.addAll(json.decode(oldFileCache));
      } else
        await cacheDirectory.create(recursive: true);

      // non-essential for startup. let it be on its own
      compute(DirectoryInfo.readDirectory, cacheDirectory)
          .then((info) => _directoryInfo = info);
      initialized = true;
      _working = false;
    }
  }

  Future<String> getRemoteFileAsText(String identifier, String source,
      {Map<String, String> headers = const {}}) async {
    return '';
  }

  Future<void> cleanUp([bool force = false]) async {
    if (!_working || force) {
      compute(
          DirectoryInfo.cleanUp, _DirectoryCleanUp(_directoryInfo, _fileCache));
    }
  }

  /// to be called before application ends,
  /// or else, any changes after last [dump] will be lost
  Future<void> dump() => saveTextFile(
      p.join(_cacheDirectory, _cacheFile), json.encode(_fileCache));
}
