import 'package:kiwi/kiwi.dart';
import 'package:sprightly/core/config/app_config.dart';
import 'package:sprightly/data/dao.dart';
import 'package:sprightly/data/datasources/database.dart' as db;
import 'package:sprightly/data/repositories/settings.dart';

Future<void> initiate(
  KiwiContainer kiwiContainer, {
  String environment,
  AppConfig configurations,
}) async {
  // initialize database
  final dataDb = db.SprightlyDatabase(
      enableDebug: configurations.debug,
      recreateDatabase: configurations.recreateDatabase);
  await dataDb.executor.ensureOpen(dataDb.attachedDatabase);
  kiwiContainer.registerSingleton((container) => dataDb);
  final settingsDb = db.SprightlySetupDatabase(
      enableDebug: configurations.debug,
      recreateDatabase: configurations.recreateDatabase);
  await settingsDb.executor.ensureOpen(settingsDb.attachedDatabase);
  kiwiContainer.registerSingleton((container) => settingsDb);

  // initialize global dao
  final appInfo = AppInformation();
  appInfo.getReady();
  kiwiContainer.registerSingleton((container) => appInfo);
  final dataDao = dataDb.sprightlyDao;
  await dataDao.getReady();
  kiwiContainer.registerSingleton<SystemDao>((container) => dataDao);
  final settingsDao = settingsDb.sprightlySetupDao;
  await settingsDao.getReady();
  kiwiContainer.registerSingleton<SettingsDao>((container) => settingsDao);

  // initialize global repo
  kiwiContainer.registerSingleton((container) =>
      SettingsRepo(container<SettingsDao>(), environment: environment));
}
