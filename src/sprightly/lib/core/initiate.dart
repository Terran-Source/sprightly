import 'package:sprightly/core/exceptions.dart';
import 'package:sprightly/utils/formatted_exception.dart';

Future<bool> initiate({
  String environment,
  Map<String, dynamic> configurations,
}) async {
  try {
    // add [PreConditionFailedException] to
    exceptionDisplay[PreConditionFailedException] =
        'Cannot go further. {message}';
    return true;
  } on Exception catch (e, st) {
    throw FormattedException(
      e,
      stackTrace: st,
      moduleName: 'sprightly.initiate',
    );
  }
}
