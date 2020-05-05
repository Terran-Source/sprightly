library sprightly.repositories;

import 'package:sprightly/extensions/enum_extensions.dart';
import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/constants/values.dart';
import 'package:sprightly/models/dao.dart';
import 'package:sprightly/models/db/database.dart';
import 'package:sprightly/utils/app_parameter.dart';
// import 'package:sprightly/models/entities.dart';

mixin _BaseData {
  SettingsDao _dao;
}

class Setting<T> extends Parameter<T> {
  factory Setting.from(AppSetting appSetting, AppSettingType type) {
    switch (type) {
      case AppSettingType.AppInfo:
      case AppSettingType.String:
        return Parameter.ofType(appSetting.name, appSetting.value);
      case AppSettingType.Number:
        return Parameter.ofType(
            appSetting.name, double.tryParse(appSetting.value));
      case AppSettingType.Bool:
        return Parameter.ofType(appSetting.name, appSetting.value == 'true');
      case AppSettingType.List:
        return Parameter.ofType(appSetting.name, appSetting.value.split(','));
      case AppSettingType.ThemeMode:
        return Parameter.ofType(
            appSetting.name, ThemeMode.values.find(appSetting.value));
      default:
        return null;
    }
  }
}

class AppSettings extends AppParameter<Setting> with _BaseData {
  static AppSettings _cache;

  AppSettings._(SettingsDao _dao, String environment) {
    super._dao = _dao;
    super.setValue(_settingNames.environment, environment);
    _dao.allAppSettings.forEach((appSetting) {
      super.updateParameter(
          appSetting.name,
          Setting.from(
              appSetting, AppSettingType.values.find(appSetting.type)));
    });
  }

  factory AppSettings(SettingsDao dao, {String environment = 'Prod'}) =>
      _cache ??= AppSettings._(dao, environment);

  AppSettingNames get _settingNames => AppSettingNames.universal;

  List<AppFont> get _appFonts => _dao.allAppFonts;
  List<FontCombo> get _fontCombos => _dao.allFontCombos;
  List<ColorCombo> get _colorCombos => _dao.allColorCombos;

  T _getSettings<T>(String name) => super.getValue<T>(name);
  Future<bool> _setSettings<T>(String name, T value, {bool isEnum = false}) =>
      updateAppSetting(name, isEnum ? T.toEnumString() : T.toString())
          .then((success) {
        if (success) super.setValue<T>(name, value);
        return success;
      });

  Stream<T> _getStream<T>(String name) =>
      (super.parameters[name] as Setting<T>).stream;

  // AppInfo details
  String get appName => _dao.appInformation.appName;
  String get packageName => _dao.appInformation.packageName;
  String get version => _dao.appInformation.version;
  String get buildNumber => _dao.appInformation.buildNumber;
  int get dbVersion => _getSettings<double>(_settingNames.dbVersion).round();

  // Debug related
  String get environment => _getSettings(_settingNames.environment);

  bool get debug => _getSettings(_settingNames.debug);
  set debug(bool value) => _setSettings(_settingNames.debug, value);
  Stream<bool> get debugStream => _getStream(_settingNames.debug);

  // database AppSettings
  bool get primarySetupComplete =>
      _getSettings(_settingNames.primarySetupComplete);
  set primarySetupComplete(bool value) =>
      _setSettings(_settingNames.primarySetupComplete, value);
  Stream<bool> get primarySetupCompleteStream =>
      _getStream(_settingNames.primarySetupComplete);

  // Themes
  ThemeMode get themeMode => _getSettings(_settingNames.themeMode);
  set themeMode(ThemeMode mode) =>
      _setSettings(_settingNames.themeMode, mode, isEnum: true);
  Stream<ThemeMode> get themeModeStream => _getStream(_settingNames.themeMode);

  Future<bool> updateAppSetting(String name, String value) =>
      _dao.updateAppSetting(name, value);

  Future<bool> updateAppSettings(Map<String, String> settings) =>
      _dao.updateAppSettings(settings);
}
