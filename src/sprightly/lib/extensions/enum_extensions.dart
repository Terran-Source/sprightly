import 'dart:math';

extension Enums<T> on List<T> {
  static String convertToString<T>(T value, [bool withQuote = false]) {
    final val = value.toString().split(".")[1];
    return withQuote ? "'$val'" : val;
  }

  T find(String val) =>
      this.firstWhere((ab) => ab.toString() == '${ab.runtimeType}.$val',
          orElse: () => null);

  List<String> toStrings([bool withQuote = false]) =>
      this.map((item) => convertToString(item, withQuote));

  T get random => this[Random().nextInt(this.length)];

  String get randomString => convertToString(this.random);

  String getConstraints(String columnName) =>
      'CHECK ($columnName IN (${this.toStrings(true).join(',')}))';
}
