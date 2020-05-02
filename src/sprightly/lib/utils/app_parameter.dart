import 'dart:async';

import 'package:flutter/foundation.dart';

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

  @protected
  StreamController<T> _controller = StreamController(sync: false);

  Type get type => _value.runtimeType;
  Stream<T> get stream => _controller.stream;

  Parameter(this.name, this._value);

  @protected
  static Parameter ofType<Tp>(String name, Tp value) =>
      Parameter<Tp>(name, value);
}

class AppParameter<T extends Parameter> {
  // static AppParameter universal = AppParameter();
  // factory AppParameter() => universal;

  @protected
  final Map<String, T> _parameters = const {};
  @protected
  Map<String, T> get parameters => _parameters;

  Parameter<Tp> setParameterValue<Tp>(String name, Tp value) =>
      _parameters[name] = Parameter.ofType(name, value);

  T setParameter(String name, T param) => _parameters[name] = param;

  Tp getValue<Tp>(String name) => (_parameters[name] as Parameter<Tp>).value;
  void setValue<Tp>(String name, Tp value) => _parameters[name].value = value;
}
