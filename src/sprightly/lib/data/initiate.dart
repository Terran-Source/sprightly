import 'package:kiwi/kiwi.dart';
import 'package:sprightly/core/config/app_config.dart';
import 'package:sprightly/data/dao.dart';
import 'package:sprightly/data/datasources/database.dart' as db;
import 'package:sprightly/data/repositories/settings.dart';

Future<void> initiate(
  Container container, {
  String environment,
  AppConfig configurations,
}) async {
  // initialize database
  final dataDb = db.SprightlyDatabase(
      enableDebug: configurations.debug,
      recreateDatabase: configurations.recreateDatabase);
  await dataDb.executor.ensureOpen(dataDb.attachedDatabase);
  container.registerSingleton((container) => dataDb);
  final settingsDb = db.SprightlySetupDatabase(
      enableDebug: configurations.debug,
      recreateDatabase: configurations.recreateDatabase);
  await settingsDb.executor.ensureOpen(settingsDb.attachedDatabase);
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
  container.registerSingleton((container) =>
      SettingsRepo(container<SettingsDao>(), environment: environment));
}
