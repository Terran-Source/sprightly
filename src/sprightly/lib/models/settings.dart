import 'package:sprightly/extensions/enum_extensions.dart';
import 'package:sprightly/models/constants/enums.dart';
import 'package:sprightly/models/db/dao.dart';
import 'package:sprightly/models/db/database.dart';

abstract class BaseData {
  final SettingsDao _dao;

  BaseData(this._dao);
}

class Setting<T> {
  final String name;
  final T value;

  Setting(this.name, this.value);

  static Setting _ofType<Tp>(String name, Tp value) => Setting<Tp>(name, value);

  factory Setting.from(AppSetting appSetting, AppSettingType type) {
    switch (type) {
      case AppSettingType.AppInfo:
      case AppSettingType.String:
        return Setting._ofType(appSetting.name, appSetting.value);
      case AppSettingType.Number:
        return Setting._ofType(
            appSetting.name, double.tryParse(appSetting.value));
      case AppSettingType.Bool:
        return Setting._ofType(appSetting.name, appSetting.value == 'true');
      case AppSettingType.List:
        return Setting._ofType(appSetting.name, appSetting.value.split(','));
      default:
        return null;
    }
  }
}

class AppSettings extends BaseData {
  final Map<String, Setting> _settings;

  AppSettings(SettingsDao _dao)
      : _settings = {},
        super(_dao) {
    _dao.allAppSettings.forEach((appSetting) {
      _settings.putIfAbsent(
          appSetting.name,
          () => Setting.from(
              appSetting, AppSettingType.values.find(appSetting.type)));
    });
  }

  List<AppFont> get _appFonts => _dao.allAppFonts;
  List<FontCombo> get _fontCombos => _dao.allFontCombos;
  List<ColorCombo> get _colorCombos => _dao.allColorCombos;

  T _getSettings<T>(String name) => (_settings[name] as Setting<T>).value;

  // AppInfo details
  // todo: set it during MigrationStrategy initiation
  String get appName => _dao.appInformation.appName;
  String get packageName => _dao.appInformation.packageName;
  String get version => _dao.appInformation.version;
  String get buildNumber => _dao.appInformation.buildNumber;
  int get dbVersion => _getSettings<double>('dbVersion').round();
  // Other settings
  bool get primarySetupComplete => _getSettings('primarySetupComplete');
}
