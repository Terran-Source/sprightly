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

class Settings extends BaseData {
  final Map<String, Setting> _settings;

  Settings(SettingsDao _dao)
      : _settings = {},
        super(_dao) {
    _dao.allAppSettings.forEach((appSetting) {
      _settings.putIfAbsent(
          appSetting.name,
          () => Setting.from(
              appSetting, AppSettingType.values.find(appSetting.type)));
    });
  }

  T _getSettings<T>(String name) => (_settings[name] as Setting<T>).value;

  String get appName => _getSettings('appName');
  String get dbVersion => _getSettings('dbVersion');
  bool get primarySetupComplete => _getSettings('primarySetupComplete');
}
