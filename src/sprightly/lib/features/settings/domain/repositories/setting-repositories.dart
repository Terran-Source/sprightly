import 'package:sprightly/features/settings/domain/entities/setting-entities.dart';
import 'package:sprightly/models/dao.dart' as dao;
import 'package:sprightly/models/repositories/settings.dart' as db;

class SettingsRepo {
  final db.AppSettings _appSettings;

  SettingsRepo(dao.SettingsDao dao, {String environment})
      : _appSettings = db.AppSettings(dao, environment: environment);

  AppDetails get appDetails => AppDetails.fromDB(_appSettings);
  AppSettings get appSettings => AppSettings.fromDB(_appSettings);
}
