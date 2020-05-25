import 'package:kiwi/kiwi.dart';
import 'package:sprightly/data/dao.dart';
import 'package:sprightly/data/datasources/database.dart' as db;
import 'package:sprightly/data/repositories/settings.dart' as repo;

Future<void> initiate(
  Container container, {
  String environment,
  Map<String, dynamic> configurations = const {},
}) async {
  final isDebug = configurations['debug'] ?? false;
  final recreateDatabase = configurations['recreateDatabase'] ?? false;

  // initialize database
  final dataDb = db.SprightlyDatabase(
      enableDebug: isDebug, recreateDatabase: recreateDatabase);
  container.registerSingleton((container) => dataDb);
  final settingsDb = db.SprightlySetupDatabase(
      enableDebug: isDebug, recreateDatabase: recreateDatabase);
  container.registerSingleton((container) => settingsDb);

  // initialize global dao
  final appInfo = AppInformation();
  appInfo.getReady();
  container.registerSingleton((container) => appInfo);
  final dataDao = dataDb.sprightlyDao;
  await dataDao.getReady();
  container
      .registerSingleton<SystemDao, db.SprightlyDao>((container) => dataDao);
  final settingsDao = settingsDb.sprightlySetupDao;
  await settingsDao.getReady();
  container.registerSingleton<SettingsDao, db.SprightlySetupDao>(
      (container) => settingsDao);

  // initialize global repo
  // repo.AppSettings repoAppSettings =
  //     repo.AppSettings(settingsDao, environment: environment);
  container.registerSingleton((container) =>
      repo.AppSettings(container<SettingsDao>(), environment: environment));
}
