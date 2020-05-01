import 'dart:developer';
import 'dart:io';

import 'package:interpolation/interpolation.dart';
import 'package:sprightly/utils/app_parameter.dart';

const Map<Type, String> exceptionDisplay = {
  Exception: "Something went wrong. {message}",
  IOException: "The system failed getting Input or taking Output. {message}",
  FileSystemException: "Problem with files. {message}",
  SocketException: "The remote connection failed due to my precious Socket.",
  HttpException:
      "Could not {method} information from internet. Unreachable {host}.",
  FormatException: "Bad formatting!!!",
};

class FormattedException<T extends Exception> {
  final T _exception;
  final Map<String, dynamic> messageParams;
  final StackTrace stackTrace;
  final String moduleName;

  String get appName => AppParameter.universal.appName;
  // todo: set debug flag
  static bool _debug = false;
  // todo: set Logger
  //static ILogger _logger;

  FormattedException(
    this._exception, {
    this.messageParams = const {},
    this.stackTrace,
    this.moduleName,
  }) {
    if (_debug) {
      //// todo: write structured log
      // _logger
      //   ..withContext(contextMap: {name: logSource, error: _exception, stackTrace: stackTrace})
      //   ..log(message);
      log(message, name: logSource, error: _exception, stackTrace: stackTrace);
    }
  }

  Interpolation _interpolation = Interpolation();

  T get exception => _exception;
  String get message => _exception.toString();
  Type get exceptionType => _exception.runtimeType;
  Map<Type, String> get _display => exceptionDisplay;
  String get logSource => '$appName:$moduleName';
  String get displayedMessage => _interpolation
      .eval(_display.containsKey(T) ? _display[T] : _display[Exception],
          messageParams)
      .trim();
}
