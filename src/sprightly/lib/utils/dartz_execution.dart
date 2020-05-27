library marganam.functional_execution;

import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:sprightly/utils/formatted_exception.dart';

class DartzExecution {
  static Future<Either<FormattedException, Right>> callEither<Right>(
    FutureOr<Right> Function() caller, {
    StackTrace stackTrace,
    Map<String, dynamic> messageParams,
    String moduleName,
  }) =>
      Task<Right>(() => Future.sync(caller))
          .attempt()
          .mapException<Right>(
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
      callEither<Right>(() => execute(
            caller,
            messageParams: messageParams,
            moduleName: moduleName,
          ));

  static FutureOr<Right> execute<Right>(
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

extension _TaskException<E extends Either<Object, R>, R> on Task<E> {
  Task<Either<FormattedException, Rt>> mapException<Rt>({
    StackTrace stackTrace,
    Map<String, dynamic> messageParams,
    String moduleName,
  }) =>
      this.map(
        (either) => either.fold((obj) {
          FormattedException result;
          if (null == obj || obj is FormattedException)
            result = (obj as FormattedException);
          else
            result = FormattedException(
              obj,
              stackTrace: stackTrace,
              messageParams: messageParams,
              moduleName: moduleName,
            );
          return Left(result);
        }, (_) => Right(_ as Rt)),
      );
}
