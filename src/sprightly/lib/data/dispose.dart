import 'package:kiwi/kiwi.dart';
import 'package:sprightly/data/datasources/database.dart';

Future<void> dispose(
  KiwiContainer kiwiContainer, {
  String environment,
  Map<String, dynamic> configurations = const {},
}) async {
  final dataDb = kiwiContainer<SprightlyDatabase>();
  await dataDb.close();
  final settingsDb = kiwiContainer<SprightlySetupDatabase>();
  await settingsDb.close();
}
