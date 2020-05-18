class PreConditionFailedException implements Exception {
  final String message;

  PreConditionFailedException(this.message);

  @override
  String toString() => 'PreConditionException not met: ${message ?? ''}';
}
