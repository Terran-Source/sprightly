import 'package:sprightly/features/settings/domain/entities/setting_entities.dart';

import 'package:sprightly/models/repositories/settings.dart' as db;

class SettingsRepo {
  final db.AppSettings _appSettings;

  SettingsRepo(this._appSettings);
  // SettingsRepo(dao.SettingsDao dao, {String environment})
  //     : _appSettings = db.AppSettings(dao, environment: environment);

  AppDetails appDetails() => AppDetails.fromDB(_appSettings);
  AppSettings appSettings() => AppSettings.fromDB(_appSettings);
}
// abstract class SettingsRepo {
//   final db.AppSettings _appSettings;

//   SettingsRepo(dao.SettingsDao dao, {String environment})
//       : _appSettings = db.AppSettings(dao, environment: environment);

//   Future<Either<FormattedException, AppDetails>> get appDetails =>
//       DartzExecution.call(() => AppDetails.fromDB(_appSettings));
//   Future<Either<FormattedException, AppSettings>> get appSettings =>
//       DartzExecution.call(() => AppSettings.fromDB(_appSettings));
// }
