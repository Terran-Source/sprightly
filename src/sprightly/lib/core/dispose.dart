import 'package:kiwi/kiwi.dart';
import 'package:sprightly/data/dispose.dart' as dbDispose;
import 'package:sprightly/utils/file_provider.dart';

Future<void> dispose({
  String environment,
  Map<String, dynamic> configurations = const {},
}) async {
  final kiwiContainer = KiwiContainer();

  await dbDispose.dispose(kiwiContainer,
      environment: environment, configurations: configurations);

  final fileCache = kiwiContainer<RemoteFileCache>();
  await fileCache.dump();

  // at last
  kiwiContainer.clear();
}
