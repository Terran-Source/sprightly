import 'package:moor/moor.dart';

import 'package:sprightly/extensions/enum_extensions.dart';

class EnumTypeConverter<T> extends TypeConverter<T, String> {
  final List<T> _values;
  final T _default;

  const EnumTypeConverter(this._values, [this._default]);

  @override
  T mapToDart(String fromDb) {
    if (fromDb == null) {
      return _default;
    }
    return _values.find(fromDb);
  }

  @override
  String mapToSql(T value) {
    if (value == null) {
      return null == _default ? null : _default.toEnumString();
    }

    return value.toEnumString();
  }
}
