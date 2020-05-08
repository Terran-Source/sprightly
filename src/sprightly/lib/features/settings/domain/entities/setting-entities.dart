import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/repositories/settings.dart' as db;

class AppDetails {
  final String _appName;
  final String _packageName;
  final String _buildNumber;
  final int _dbVersion;

  AppDetails._(
      this._appName, this._packageName, this._buildNumber, this._dbVersion);

  static AppDetails _cache;
  factory AppDetails.fromDB(db.AppSettings appSettings) =>
      _cache ??= AppDetails._(
        appSettings.appName,
        appSettings.packageName,
        appSettings.buildNumber,
        appSettings.dbVersion,
      );

  String get appName => _appName;
  String get packageName => _packageName;
  String get buildNumber => _buildNumber;
  int get dbVersion => _dbVersion;
}

class AppSettings {
  final db.AppSettings _appSettings;

  AppSettings._(this._appSettings);

  static AppSettings _cache;
  factory AppSettings.fromDB(db.AppSettings appSettings) =>
      _cache ??= AppSettings._(appSettings);

  String get environment => _appSettings.environment;
  bool get debug => _appSettings.debug;
  set debug(bool value) => _appSettings.debug = value;
  bool get primarySetupComplete => _appSettings.primarySetupComplete;
  set primarySetupComplete(bool value) =>
      _appSettings.primarySetupComplete = value;
  ThemeMode get themeMode => _appSettings.themeMode;
  set themeMode(ThemeMode mode) => _appSettings.themeMode = mode;
}
