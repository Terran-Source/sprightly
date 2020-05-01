class AppSettingNames {
  static AppSettingNames universal = AppSettingNames();
  factory AppSettingNames() => universal;

  String get dbVersion => 'dbVersion';

  // Other settings
  String get primarySetupComplete => 'primarySetupComplete';

  // Themes
  String get themeMode => 'themeMode';
}

class AppParameterNames {
  static AppParameterNames universal = AppParameterNames();
  factory AppParameterNames() => universal;

  String get environment => 'environment';
  String get debug => 'debug';

  String get appName => 'appName';
  String get dbModuleName => 'moor_database';
  String get fileIoModuleName => 'file_provider';
}
