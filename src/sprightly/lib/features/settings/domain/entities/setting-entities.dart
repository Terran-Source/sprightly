import 'package:sprightly/models/repositories/settings.dart' as db;

class AppDetails {
  final String _appName;
  final String _packageName;
  final String _buildNumber;
  final int _dbVersion;

  AppDetails._(
      this._appName, this._packageName, this._buildNumber, this._dbVersion);

  factory AppDetails.fromDB(db.AppSettings appSettings) => AppDetails._(
      appSettings.appName,
      appSettings.packageName,
      appSettings.buildNumber,
      appSettings.dbVersion);

  String get appName => _appName;
  String get packageName => _packageName;
  String get buildNumber => _buildNumber;
  int get dbVersion => _dbVersion;
}

class AppSettings {
  String environment;
  bool debug;
}
