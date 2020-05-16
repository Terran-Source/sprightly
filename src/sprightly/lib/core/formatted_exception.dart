library sprightly.functional_exception;

import 'dart:developer';
import 'dart:io';

import 'package:interpolation/interpolation.dart';

final Map<Type, String> exceptionDisplay = {
  Exception: "Something went wrong. {message}",
  FormatException: "Bad formatting!!! {message}",
  IOException: "The system failed getting Input or taking Output. {message}",
  FileSystemException: "Problem with files. {message}",
  HttpException:
      "Could not {method} information from internet. Unreachable {host}.",
  SocketException:
      "The remote connection failed due to my precious Socket. {message}",
  WebSocketException:
      "The remote connection failed due to my precious Socket. {message}",
  SignalException: 'Some signal went wrong.  {message}',
  StdinException:
      'Someone tried to give some input, that I couldn\'t understand. {message}',
  StdoutException: 'Oops, I\'m unable to express my output. {message}',
  ProcessException: 'Process went bad. {message}',
  TlsException: 'It\'s the security protocol named TLS to blame. {message}',
};

class FormattedException<T extends Exception> {
  final T _exception;
  final Map<String, dynamic> messageParams;
  final StackTrace stackTrace;
  final String moduleName;

  static String appName;
  static bool debug = false;
  // TODO: set Logger
  //static ILogger _logger;

  FormattedException(
    this._exception, {
    this.messageParams = const {},
    this.stackTrace,
    this.moduleName,
  }) {
    if (debug) {
      //// TODO: write structured log
      // _logger
      //   ..withContext(contextMap: {
      //     name: logSource,
      //     error: _exception,
      //     messageParams: messageParams,
      //     stackTrace: stackTrace,
      //   })
      //   ..log(message);
      log(message, name: logSource, error: _exception, stackTrace: stackTrace);
    }
  }

  Interpolation _interpolation = Interpolation();

  T get exception => _exception;
  String get message => _exception.toString();
  Type get exceptionType => _exception.runtimeType;

  Type get _displayExceptionType =>
      exceptionDisplay.containsKey(exceptionType) ? exceptionType : Exception;

  // Map<Type, String> get _display => exceptionDisplay;
  String get logSource =>
      '${appName ?? 'FormattedException'}:${moduleName ?? 'Generic'}';
  String get displayedMessage => _interpolation
      .eval(exceptionDisplay[_displayExceptionType], messageParams)
      .trim();
}
