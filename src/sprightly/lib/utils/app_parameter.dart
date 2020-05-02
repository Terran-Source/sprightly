library sprightly.app_settings;

import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:sprightly/utils/file_provider.dart';

class Parameter<T> {
  final String name;

  Parameter(this.name, this._value);

  @protected
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
  final Map<String, T> _parameters = const {};
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

  static Future<List<T>> load<T extends Parameter>(
    String source, {
    String assetDirectory,
    String identifier,
    Map<String, String> headers,
    List<TypeConverter> typeConverters,
  }) async {
    if (null != source) {
      String sourceAsText;
      try {
        Uri.parse(source);
        sourceAsText = await RemoteFileCache.universal
            .getRemoteText(source, identifier: identifier, headers: headers);
      } on FormatException {
        sourceAsText =
            await getAssetText(source, assetDirectory: assetDirectory);
      }
      if (null != sourceAsText && sourceAsText.isNotEmpty) {
        Map<String, dynamic> jsonValue = await json.decode(sourceAsText);
        if (null != typeConverters) {
          return jsonValue.entries.map((j) {
            var val = j.value;
            var converter =
                typeConverters.firstWhere((tc) => tc.parameterName == j.key);
            if (null != converter) val = converter.convert(val);
            return Parameter.ofType(j.key, val);
          });
        } else {
          return jsonValue.entries.map((j) => Parameter.ofType(j.key, j.value));
        }
      }
      throw new FormatException("[source] is either null or empty");
    }
    throw new FormatException(
        "Please provide a valid [source]. Either an asset directory path or a web accessible address.",
        source);
  }
}
