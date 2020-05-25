import 'package:kiwi/kiwi.dart';
import 'package:sprightly/data/datasources/database.dart';

Future<void> dispose(
  Container container, {
  String environment,
  Map<String, dynamic> configurations = const {},
}) async {
  final dataDb = container<SprightlyDatabase>();
  await dataDb.close();
  final settingsDb = container<SprightlySetupDatabase>();
  await settingsDb.close();
}
