class AppSettingNames {
  const AppSettingNames._();
  static AppSettingNames universal = AppSettingNames._();
  factory AppSettingNames() => universal;

  // App Information
  String get appName => 'appName';
  String get packageName => 'packageName';
  String get version => 'version';
  String get buildNumber => 'buildNumber';
  // Debug related

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
