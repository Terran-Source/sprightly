library marganam.app_settings;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sprightly/utils/file_provider.dart';

class Parameter<T> {
  final String name;

  Parameter(this.name, this._value);

  static Parameter ofType<Tp>(String name, Tp value) =>
      Parameter<Tp>(name, value);

  T _value;
  T get value => _value;
  set value(T val) {
    if (type == val.runtimeType) {
      _value = val;
      _controller.add(_value);
    }
  }

  @protected
  StreamController<T> _controller = StreamController(sync: false);

  Type get type => _value.runtimeType;
  Stream<T> get stream => _controller.stream;
}

abstract class TypeConverter<Dest> {
  String parameterName;
  Dest convert(dynamic source);
}

class AppParameter<T extends Parameter> {
  @protected
  final Map<String, T> _parameters = {};
  @protected
  Map<String, T> get parameters => _parameters;

  Parameter<Tp> setParameterValue<Tp>(String name, Tp value) =>
      _parameters[name] = Parameter.ofType(name, value);

  T setParameter(String name, T param) => _parameters[name] = param;

  T updateParameter(String name, T param) {
    if (_parameters.containsKey(name)) _parameters.remove(name);
    return setParameter(name, param);
  }

  Tp getValue<Tp>(String name) => (_parameters[name] as Parameter<Tp>).value;
  void setValue<Tp>(String name, Tp value) => _parameters[name].value = value;

  static List<T> getParamList<T extends Parameter>(
    String jsonText, {
    List<TypeConverter> typeConverters,
  }) {
    if (null != jsonText && jsonText.isNotEmpty) {
      Map<String, dynamic> jsonValue = json.decode(jsonText);
      if (null != typeConverters) {
        return jsonValue.entries.map((j) {
          var val = j.value;
          final converter =
              typeConverters.firstWhere((tc) => tc.parameterName == j.key);
          if (null != converter) val = converter.convert(val);
          return Parameter.ofType(j.key, val);
        });
      } else {
        return jsonValue.entries.map((j) => Parameter.ofType(j.key, j.value));
      }
    }
    throw new FormatException("[jsonText] is either null or empty");
  }

  static Future<List<T>> loadParamsRemote<T extends Parameter>(
    String source, {
    String identifier,
    Map<String, String> headers,
    List<TypeConverter> typeConverters,
  }) async {
    Uri.parse(source);
    final jsonText = await RemoteFileCache.universal
        .getRemoteText(source, identifier: identifier, headers: headers);
    return getParamList(jsonText, typeConverters: typeConverters);
  }

  static Future<List<T>> loadParamsLocal<T extends Parameter>(
    String source, {
    String assetDirectory,
    List<TypeConverter> typeConverters,
  }) async {
    final jsonText = await getAssetText(source, assetDirectory: assetDirectory);

    return getParamList(jsonText, typeConverters: typeConverters);
  }
}
