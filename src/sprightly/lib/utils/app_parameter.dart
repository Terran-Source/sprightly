import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:sprightly/models/constants/values.dart';

class Parameter<T> {
  final String name;
  T _value;
  T get value => _value;
  set value(T val) {
    if (type == val.runtimeType) {
      _value = val;
      _controller.add(_value);
    }
  }

  StreamController<T> _controller = StreamController(sync: false);

  Type get type => _value.runtimeType;
  Stream<T> get stream => _controller.stream;

  Parameter(this.name, this._value);

  @protected
  static Parameter ofType<Tp>(String name, Tp value) =>
      Parameter<Tp>(name, value);
}

class AppParameter {
  static AppParameter universal = AppParameter();
  factory AppParameter() => universal;

  final Map<String, Parameter> _parameters = const {};

  AppParameterNames get _params => AppParameterNames.universal;

  Parameter<T> set<T>(String name, T value) =>
      _parameters[name] = Parameter.ofType(name, value);

  T getParameter<T>(String name) => _parameters[name].value;
  void setParameter<T>(String name, T value) => _parameters[name].value = value;

  String get environment => getParameter(_params.environment);
  set environment(String value) => setParameter(_params.environment, value);
  bool get debug => getParameter(_params.debug);
  set debug(bool value) => setParameter(_params.debug, value);

  String get appName => getParameter(_params.appName);
  set appName(String value) => setParameter(_params.appName, value);
  String get dbModuleName => _params.dbModuleName;
  String get fileIoModuleName => _params.fileIoModuleName;
}
