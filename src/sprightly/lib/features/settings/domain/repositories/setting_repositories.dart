import 'package:sprightly/features/settings/domain/entities/setting_entities.dart';

import 'package:sprightly/models/repositories/settings.dart' as db;

class SettingsRepo {
  final db.AppSettings _appSettings;

  SettingsRepo(this._appSettings);

  AppDetails appDetails() => AppDetails.fromDB(_appSettings);
  AppSettings appSettings() => AppSettings.fromDB(_appSettings);
}
