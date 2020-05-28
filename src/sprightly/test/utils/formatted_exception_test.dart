import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interpolation/interpolation.dart';
import 'package:sprightly/utils/formatted_exception.dart';

final _interpolation = Interpolation();
final Map<Type, String> _backUp = {};
final newExceptionMessage = 'This is a dummy exception message';

void main() {
  cloneMap(exceptionDisplay, _backUp);

  tearDown(() {
    cloneMap(_backUp, exceptionDisplay);
    FormattedException.appName = null;
    FormattedException.debug = false;
  });

  group('exceptionDisplay extended test', () {
    test('new type can be added', () {
      // act
      exceptionDisplay[Future] = newExceptionMessage;

      // assert
      expect(exceptionDisplay.containsKey(Future), isTrue);
      expect(exceptionDisplay[Future], newExceptionMessage);
    });
    test('should not contain other type', () {
      // assert
      expect(exceptionDisplay.containsKey(Future), isFalse);
    });
  });

  final appName = 'Sprightly';
  final moduleName = 'someModule';
  final messageParams = {
    'message': newExceptionMessage,
    'method': 'GET',
    'host': 'https://www.example.com',
  };
  List<Exception> exceptions = [
    Exception(newExceptionMessage),
    FormatException(newExceptionMessage, Uri.parse('https://www.example.com')),
    FileSystemException(newExceptionMessage, '/path/to/something',
        OSError(newExceptionMessage, 404)),
    HttpException(newExceptionMessage,
        uri: Uri.parse('https://www.example.com')),
    SocketException(newExceptionMessage,
        osError: OSError(newExceptionMessage, 404),
        address: InternetAddress('127.0.0.1'),
        port: 80),
    WebSocketException(newExceptionMessage),
    SignalException(newExceptionMessage, OSError(newExceptionMessage, 404)),
    StdinException(newExceptionMessage, OSError(newExceptionMessage, 404)),
    StdoutException(newExceptionMessage, OSError(newExceptionMessage, 404)),
    ProcessException(
        'SomeProcess',
        List<String>.generate(3, (i) => WordPair.random().asString),
        newExceptionMessage,
        404),
    TlsException(newExceptionMessage, OSError(newExceptionMessage, 404)),
    _CustomException(newExceptionMessage, 'My Custom Exception MEssage')
  ];
  exceptions.forEach((exception) => formattedExceptionGroupTest(
      exception, appName, moduleName, messageParams,
      runtimeType:
          exception.runtimeType.toString().startsWith('_') ? Exception : null));

  // check with a custom exception with added details to exceptionDisplay
  final customException =
      _CustomException(newExceptionMessage, 'My Custom Exception Message');
  formattedExceptionGroupTest(
      customException, appName, moduleName, messageParams,
      doSetup: true);

  // check with a existing exception with changed details to exceptionDisplay
  final customHttpException = HttpException(newExceptionMessage,
      uri: Uri.parse('https://www.example.com'));
  formattedExceptionGroupTest(
      customHttpException, appName, moduleName, messageParams,
      doSetup: true);
}

void cloneMap<K, V>(Map<K, V> source, Map<K, V> dest) {
  dest.clear();
  source.forEach((key, value) => dest[key] = value);
}

void formattedExceptionGroupTest<T extends Exception>(
  T exception,
  String appName,
  String moduleName,
  Map<String, dynamic> messageParams, {
  Type runtimeType,
  bool doSetup = false,
}) {
  runtimeType = runtimeType ?? exception.runtimeType;
  final actualRuntimeType = exception.runtimeType;
  group(
      'FormattedException test for $actualRuntimeType${doSetup ? ': with setup' : ''}',
      () {
    setUp(() {
      if (doSetup) {
        exceptionDisplay[_CustomException] =
            'CustomException: $newExceptionMessage. {message}';
        exceptionDisplay[HttpException] =
            'The HttpException message has been changed. {message}';
        print(
            'New Message set: (_CustomException): ${exceptionDisplay[_CustomException]}');
        print(
            'New Message set: (HttpException): ${exceptionDisplay[HttpException]}');
      }
    });
    test('create new instance', () {
      // act
      final result = FormattedException(exception);
      print('result Type: ${result.runtimeType}');
      print('inner Exception Type: ${result.exceptionType}');

      // assert
      expect(result, isInstanceOf<FormattedException<Exception>>());
      expect(
          result, isNot(isInstanceOf<FormattedException<FormatException>>()));
      expect(result.exception, isInstanceOf<T>());
      expect(result.exception, exception);
      expect(result.message, exception.toString());
      expect(result.exceptionType, actualRuntimeType);
      expect(result.logSource, 'FormattedException:Generic');
      expect(result.displayedMessage,
          _interpolation.eval(exceptionDisplay[runtimeType], {}).trim());
    });
    test('set FormattedException appName', () {
      // arrange
      FormattedException.appName = appName;

      // act
      final result = FormattedException(exception);

      // assert
      expect(result, isInstanceOf<FormattedException<Exception>>());
      expect(
          result, isNot(isInstanceOf<FormattedException<FormatException>>()));
      expect(result.exception, isInstanceOf<T>());
      expect(result.exception, exception);
      expect(result.message, exception.toString());
      expect(result.exceptionType, actualRuntimeType);
      expect(result.logSource, 'Sprightly:Generic');
      expect(result.displayedMessage,
          _interpolation.eval(exceptionDisplay[runtimeType], {}).trim());
    });
    test('set FormattedException moduleName', () {
      // act
      final result = FormattedException(exception, moduleName: moduleName);

      // assert
      expect(result, isInstanceOf<FormattedException<Exception>>());
      expect(
          result, isNot(isInstanceOf<FormattedException<FormatException>>()));
      expect(result.exception, isInstanceOf<T>());
      expect(result.exception, exception);
      expect(result.message, exception.toString());
      expect(result.exceptionType, actualRuntimeType);
      expect(result.logSource, 'FormattedException:$moduleName');
      expect(result.displayedMessage,
          _interpolation.eval(exceptionDisplay[runtimeType], {}).trim());
    });
    test('set both FormattedException appName & moduleName', () {
      // arrange
      FormattedException.appName = appName;

      // act
      final result = FormattedException(exception, moduleName: moduleName);

      // assert
      expect(result, isInstanceOf<FormattedException<Exception>>());
      expect(
          result, isNot(isInstanceOf<FormattedException<FormatException>>()));
      expect(result.exception, isInstanceOf<T>());
      expect(result.exception, exception);
      expect(result.message, exception.toString());
      expect(result.exceptionType, actualRuntimeType);
      expect(result.logSource, '$appName:$moduleName');
      expect(result.displayedMessage,
          _interpolation.eval(exceptionDisplay[runtimeType], {}).trim());
    });
    test('set FormattedException messageParams', () {
      // act
      final result =
          FormattedException(exception, messageParams: messageParams);

      // assert
      expect(result, isInstanceOf<FormattedException<Exception>>());
      expect(
          result, isNot(isInstanceOf<FormattedException<FormatException>>()));
      expect(result.exception, isInstanceOf<T>());
      expect(result.exception, exception);
      expect(result.message, messageParams['message']);
      expect(result.exceptionType, actualRuntimeType);
      expect(result.logSource, 'FormattedException:Generic');
      expect(
          result.displayedMessage,
          _interpolation
              .eval(exceptionDisplay[runtimeType], messageParams)
              .trim());
    });
    test('set all FormattedException parameters', () {
      // arrange
      FormattedException.appName = appName;

      // act
      final result = FormattedException(
        exception,
        messageParams: messageParams,
        stackTrace: StackTrace.current,
        moduleName: moduleName,
      );

      // assert
      expect(result, isInstanceOf<FormattedException<Exception>>());
      expect(
          result, isNot(isInstanceOf<FormattedException<FormatException>>()));
      expect(result.exception, isInstanceOf<T>());
      expect(result.exception, exception);
      expect(result.message, messageParams['message']);
      expect(result.exceptionType, actualRuntimeType);
      expect(result.logSource, '$appName:$moduleName');
      expect(
          result.displayedMessage,
          _interpolation
              .eval(exceptionDisplay[runtimeType], messageParams)
              .trim());
      print(result.displayedMessage);
    });
  });
}

class _CustomException implements Exception {
  final String customMessage;
  final Exception exception;

  _CustomException(String message, this.customMessage)
      : exception = Exception(message);

  @override
  String toString() => '${exception.toString()} $customMessage';
}
