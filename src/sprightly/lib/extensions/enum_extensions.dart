import 'dart:math';

extension Enums<T> on List<T> {
  static String toEnumString<T>(T value, [bool withQuote = false]) {
    if (null != value) {
      final val = value.toString().split(".").last;
      return withQuote ? "'$val'" : val;
    }
    return null;
  }

  T find(String val) =>
      this.firstWhere((ab) => ab.toString() == '${ab.runtimeType}.$val',
          orElse: () => null);

  List<String> toStrings([bool withQuote = false]) =>
      this.map((item) => toEnumString(item, withQuote));

  T get random => this[Random().nextInt(this.length)];

  String randomString([bool withQuote = false]) =>
      toEnumString(this.random, withQuote);

  String getConstraints(String columnName) =>
      'CHECK ($columnName IN (${this.toStrings(true).join(',')}))';
}

extension EnumExt<T> on T {
  String toEnumString([bool withQuote = false]) =>
      Enums.toEnumString(this, withQuote);
}
