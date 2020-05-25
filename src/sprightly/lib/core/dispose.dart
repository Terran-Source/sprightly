import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:sprightly/data/dispose.dart' as dbDispose;
import 'package:sprightly/utils/file_provider.dart';

Future<void> dispose({
  String environment,
  Map<String, dynamic> configurations = const {},
}) async {
  final container = kiwi.Container();

  await dbDispose.dispose(container,
      environment: environment, configurations: configurations);

  final fileCache = container<RemoteFileCache>();
  await fileCache.dump();

  // at last
  container.clear();
}
