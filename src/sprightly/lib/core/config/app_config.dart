library sprightly.config;

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:sprightly/utils/file_provider.dart';
import 'package:sprightly/utils/json_util.dart';

part 'app_config.g.dart';

@JsonSerializable()
class AppConfig extends Equatable {
  final bool debug;
  final bool recreateDatabase;

  @override
  List<Object> get props => [debug, recreateDatabase];

  AppConfig({this.debug, this.recreateDatabase});

  factory AppConfig.defaults() =>
      AppConfig(debug: false, recreateDatabase: false);

  factory AppConfig.fromJson(Map<String, dynamic> json) =>
      _$AppConfigFromJson(json);

  Map<String, dynamic> get toJson => _$AppConfigToJson(this);

  static String get _configBaseDirectory => 'assets/config';
  static String get _configBaseFile => 'config.json';

  static Future<Map<String, dynamic>> _jsonMap(configFileName) async {
    try {
      return json.decode(await getAssetText(configFileName,
          assetDirectory: _configBaseDirectory));
    } catch (_) {
      return null;
    }
  }

  static Future<AppConfig> from(String environment) async {
    var json = await _jsonMap(_configBaseFile);
    if (null != environment) {
      final envConfigFile = "${[
        p.basenameWithoutExtension(_configBaseFile),
        environment.toLowerCase()
      ].join('.')}"
          "${p.extension(_configBaseFile)}";
      final jsonEnv = await _jsonMap(envConfigFile);
      if (null != jsonEnv) extend(json, jsonEnv);
    }
    if (null != json) return AppConfig.fromJson(json);
    return AppConfig.defaults();
  }
}
