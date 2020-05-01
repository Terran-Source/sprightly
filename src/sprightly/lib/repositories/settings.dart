library sprightly.repositories;

import 'package:sprightly/extensions/enum_extensions.dart';
import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/constants/values.dart';
import 'package:sprightly/models/dao.dart';
import 'package:sprightly/models/db/database.dart';
import 'package:sprightly/utils/app_parameter.dart';
// import 'package:sprightly/models/entities.dart';

abstract class BaseData {
  final SettingsDao _dao;

  BaseData(this._dao);
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

class AppSettings extends BaseData {
  static AppSettings _cache;
  final Map<String, Setting> _settings;
  AppSettingNames get _setting => AppSettingNames.universal;

  AppSettings._(SettingsDao _dao)
      : _settings = {},
        super(_dao) {
    _dao.allAppSettings.forEach((appSetting) {
      _settings.putIfAbsent(
          appSetting.name,
          () => Setting.from(
              appSetting, AppSettingType.values.find(appSetting.type)));
    });
  }

  factory AppSettings(SettingsDao dao) => _cache ??= AppSettings._(dao);

  List<AppFont> get _appFonts => _dao.allAppFonts;
  List<FontCombo> get _fontCombos => _dao.allFontCombos;
  List<ColorCombo> get _colorCombos => _dao.allColorCombos;

  T _getSettings<T>(String name) => (_settings[name] as Setting<T>).value;
  void _setSettings<T>(String name, T value, {bool isEnum = false}) {
    updateAppSetting(name, isEnum ? T.toEnumString() : T.toString())
        .then((success) {
      if (success) _settings[name].value = T;
    });
  }

  Stream<T> _getStream<T>(String name) =>
      (_settings[name] as Setting<T>).stream;

  // AppInfo details
  // todo: set it during MigrationStrategy initiation
  String get appName => _dao.appInformation.appName;
  String get packageName => _dao.appInformation.packageName;
  String get version => _dao.appInformation.version;
  String get buildNumber => _dao.appInformation.buildNumber;
  int get dbVersion => _getSettings<double>(_setting.dbVersion).round();

  // Other settings
  bool get primarySetupComplete => _getSettings(_setting.primarySetupComplete);
  set primarySetupComplete(bool value) =>
      _setSettings(_setting.primarySetupComplete, value);
  Stream<bool> get primarySetupCompleteStream =>
      _getStream(_setting.primarySetupComplete);

  // Themes
  ThemeMode get themeMode => _getSettings(_setting.themeMode);
  set themeMode(ThemeMode mode) =>
      _setSettings(_setting.themeMode, mode, isEnum: true);
  Stream<ThemeMode> get themeModeStream => _getStream(_setting.themeMode);

  Future<bool> updateAppSetting(String name, String value) =>
      _dao.updateAppSetting(name, value);

  Future<bool> updateAppSettings(Map<String, String> settings) =>
      _dao.updateAppSettings(settings);
}
