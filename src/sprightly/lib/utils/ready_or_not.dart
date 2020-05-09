import 'dart:async';

typedef FutureOr<T> ReadyOrNotWorker<T>();

mixin ReadyOrNotMixin<T> {
  bool _initialized = false;
  bool _working = false;
  FutureOr<T> _future;
  ReadyOrNotWorker<T> getReadyWorker;
  final Map<String, ReadyOrNotWorker> additionalSingleJobs = {};
  final Set<String> _workingJobs = Set<String>();
  final Map<String, FutureOr> _workingFutures = {};

  bool get ready => _initialized;
  FutureOr getReady() async {
    if (!_initialized && !_working) {
      _working = true;
      try {
        _future = getReadyWorker();
        await _future;
        _initialized = true;
      } finally {
        _future = null;
        _working = false;
      }
    } else if (_working) await _future;
  }

  FutureOr<R> triggerJob<R>(String jobName, {bool onReady = true}) async {
    var shouldProceed = additionalSingleJobs.containsKey(jobName);
    if (shouldProceed) {
      var alreadyWorking = _workingJobs.contains(jobName);
      if (onReady) {
        shouldProceed = ready;
      }
      if (shouldProceed && !alreadyWorking) {
        _workingJobs.add(jobName);
        try {
          FutureOr<R> jobFuture = additionalSingleJobs[jobName]();
          _workingFutures[jobName] = jobFuture;
          return await jobFuture;
        } finally {
          _workingFutures.remove(jobName);
          _workingJobs.remove(jobName);
        }
      } else if (alreadyWorking) {
        return await (_workingFutures[jobName] as FutureOr<R>);
      }
    }
    return null;
  }
}
