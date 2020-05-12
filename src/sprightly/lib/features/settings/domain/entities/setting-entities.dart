import 'package:equatable/equatable.dart';
import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/repositories/settings.dart' as db;

class AppDetails extends Equatable {
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;
  final int dbVersion;

  @override
  List<Object> get props =>
      [appName, packageName, version, buildNumber, dbVersion];

  AppDetails._(
    this.appName,
    this.packageName,
    this.version,
    this.buildNumber,
    this.dbVersion,
  );

  static AppDetails _cache;
  factory AppDetails.fromDB(db.AppSettings appSettings) =>
      _cache ??= AppDetails._(
        appSettings.appName,
        appSettings.packageName,
        appSettings.version,
        appSettings.buildNumber,
        appSettings.dbVersion,
      );
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
