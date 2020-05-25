import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:sprightly/core/exceptions.dart';
import 'package:sprightly/core/widgets/error_popup.dart';
import 'package:sprightly/data/initiate.dart' as dbInitiate;
import 'package:sprightly/features/settings/domain/entities/setting_entities.dart';
import 'package:sprightly/features/settings/initiate.dart' as settingsInitiate;
import 'package:sprightly/utils/file_provider.dart';
import 'package:sprightly/utils/formatted_exception.dart';

Future<bool> initiate({
  String environment,
  Map<String, dynamic> configurations = const {},
}) async {
  try {
    final container = kiwi.Container();

    final isDebug = configurations['debug'] ?? false;

    // add [PreConditionFailedException] to exceptionDisplay
    exceptionDisplay[PreConditionFailedException] =
        'Cannot go further. {message}';

    container.registerSingleton((container) => RemoteFileCache());

    // initiate database
    await dbInitiate.initiate(container,
        environment: environment, configurations: configurations);

    await settingsInitiate.initiate(container,
        environment: environment, configurations: configurations);

    final appDetails = container<AppDetails>();
    FormattedException.appName = appDetails.appName;
    FormattedException.debug = isDebug;

    return true;
  } on FormattedException catch (e) {
    showErrorPopup(e);
  } on Exception catch (e, st) {
    showErrorPopup(FormattedException(
      e,
      stackTrace: st,
      moduleName: 'sprightly.initiate',
    ));
  }
  return false;
}
