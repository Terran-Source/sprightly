// @JsonSerializable()
class AppConfig {
  bool debug;
  bool recreateDatabase;

  AppConfig({this.debug, this.recreateDatabase});

  // TODO: read from embedded json as per environment
  factory AppConfig.from(String environment) {
    return AppConfig(debug: false, recreateDatabase: true);
  }
}
