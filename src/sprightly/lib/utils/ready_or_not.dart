import 'dart:async';

typedef FutureOr<T> ReadyOrNotWorker<T>();

mixin ReadyOrNotMixin<T> {
  bool _initialized = false;
  bool _working = false;
  Future<T> _future;
  ReadyOrNotWorker<T> getReadyWorker;

  bool get ready => _initialized;
  FutureOr getReady() async {
    if (!_initialized && !_working) {
      _working = true;
      try {
        _future = getReadyWorker();
        await _future;
        _initialized = true;
      } finally {
        _working = false;
      }
    } else if (_working) await _future;
  }
}
