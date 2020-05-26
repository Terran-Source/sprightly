import 'package:sprightly/features/settings/domain/entities/setting_entities.dart';

import 'package:sprightly/data/repositories/settings.dart' as db;

class SettingsRepo {
  final db.SettingsRepo _dbSettingsRepo;

  SettingsRepo(this._dbSettingsRepo);

  AppDetails appDetails() => AppDetails.fromDB(_dbSettingsRepo);
  AppSettings appSettings() => AppSettings.fromDB(_dbSettingsRepo);
}
