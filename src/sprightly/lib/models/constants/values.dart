class AppSettingNames {
  static AppSettingNames universal = AppSettingNames();
  factory AppSettingNames() => universal;

  // Debug related
  String get environment => 'environment';
  String get debug => 'debug';
  // Debug related

  // database related
  String get dbVersion => 'dbVersion';

  // database AppSettings
  String get primarySetupComplete => 'primarySetupComplete';

  // Themes
  String get themeMode => 'themeMode';
}
