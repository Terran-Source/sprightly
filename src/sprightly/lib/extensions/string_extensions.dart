extension Trimmer on String {
  String get escapedTrim => RegExp.escape(this.trim());

  String trimming(String trimmer) {
    var pattern = RegExp(
        '^[${trimmer.escapedTrim}]+(.*(?<![${trimmer.escapedTrim}]+))[${trimmer.escapedTrim}]+',
        caseSensitive: true,
        multiLine: false,
        dotAll: true);
    return this
        .trim()
        .replaceAllMapped(pattern, (match) => '${match.group(1)}')
        .trim();
  }

  String trimmed(List<String> trimmer) =>
      trimmer.fold(this, (str, trm) => str.trimming(trm));
}
