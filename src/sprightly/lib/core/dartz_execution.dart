library sprightly.functional_execution;

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:sprightly/core/formatted_exception.dart';

class DartzExecution {
  static Future<Either<FormattedException, Right>> callEither<Right>(
    FutureOr<Right> Function() caller, {
    StackTrace stackTrace,
    Map<String, dynamic> messageParams,
    String moduleName,
  }) =>
      Task(() => caller())
          .attempt()
          .mapException(
            stackTrace: stackTrace,
            messageParams: messageParams,
            moduleName: moduleName,
          )
          .run();

  static Future<Either<FormattedException, Right>> call<Right>(
    FutureOr<Right> Function() caller, {
    Map<String, dynamic> messageParams,
    String moduleName,
  }) =>
      callEither(() => execute(
            caller,
            messageParams: messageParams,
            moduleName: moduleName,
          ));

  static Future<Right> execute<Right>(
    FutureOr<Right> Function() caller, {
    Map<String, dynamic> messageParams,
    String moduleName,
  }) {
    try {
      return caller();
    } on Exception catch (exception, stackTrace) {
      throw FormattedException(
        exception,
        stackTrace: stackTrace,
        messageParams: messageParams,
        moduleName: moduleName,
      );
    }
  }
}

extension TaskException<E extends Either<Object, Right>, Right> on Task<E> {
  Task<Either<FormattedException, Right>> mapException({
    StackTrace stackTrace,
    Map<String, dynamic> messageParams,
    String moduleName,
  }) =>
      this.map(
        (either) => either.leftMap((obj) {
          if (obj is FormattedException) return obj;
          // else
          return FormattedException(
            obj,
            stackTrace: stackTrace,
            messageParams: messageParams,
            moduleName: moduleName,
          );
        }),
      );
}
