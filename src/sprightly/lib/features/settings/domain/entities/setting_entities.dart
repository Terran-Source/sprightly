import 'package:equatable/equatable.dart';
import 'package:sprightly/data/constants/enums.dart';
import 'package:sprightly/data/repositories/settings.dart';

class AppDetails extends Equatable {
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;
  final int dbVersion;

  AppDetails._(
    this.appName,
    this.packageName,
    this.version,
    this.buildNumber,
    this.dbVersion,
  );

  static AppDetails _cache;
  factory AppDetails.fromDB(SettingsRepo settingsRepo) =>
      _cache ??= AppDetails._(
        settingsRepo.appName,
        settingsRepo.packageName,
        settingsRepo.version,
        settingsRepo.buildNumber,
        settingsRepo.dbVersion,
      );

  @override
  List<Object> get props =>
      [appName, packageName, version, buildNumber, dbVersion];
}

class AppSettings extends Equatable {
  final SettingsRepo _settingsRepo;

  AppSettings._(this._settingsRepo);

  static AppSettings _cache;
  factory AppSettings.fromDB(SettingsRepo appSettings) =>
      _cache ??= AppSettings._(appSettings);

  @override
  List<Object> get props =>
      [environment, debug, primarySetupComplete, themeMode];

  String get environment => _settingsRepo.environment;
  bool get debug => _settingsRepo.debug;
  set debug(bool value) => _settingsRepo.debug = value;
  bool get primarySetupComplete => _settingsRepo.primarySetupComplete;
  set primarySetupComplete(bool value) =>
      _settingsRepo.primarySetupComplete = value;
  ThemeMode get themeMode => _settingsRepo.themeMode;
  set themeMode(ThemeMode mode) => _settingsRepo.themeMode = mode;
}
