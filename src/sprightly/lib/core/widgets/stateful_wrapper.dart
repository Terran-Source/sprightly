import 'package:flutter/widgets.dart';

typedef Future<T> AsyncFunction<T>();

/// Wrapper for stateful functionality to provide onInit calls in stateless widget
///
/// get the idea from: https://medium.com/filledstacks/how-to-call-a-function-on-start-in-flutter-stateless-widgets-28d90ab3bf49
class StatefulWrapper<T> extends StatefulWidget {
  final AsyncFunction<T> onInit;
  final Widget loading;
  final Widget complete;
  final Widget error;

  const StatefulWrapper({
    @required this.onInit,
    this.loading,
    @required this.complete,
    this.error,
  });

  @override
  _StatefulWrapperState createState() => _StatefulWrapperState();
}

class _StatefulWrapperState<T> extends State<StatefulWrapper<T>> {
  T _state;
  bool _error = false;

  @override
  void initState() {
    super.initState();
    if (widget.onInit != null) {
      try {
        widget.onInit().then((result) => setState(() {
              _state = result;
            }));
      } catch (e) {
        _error = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_error) return widget.error ?? widget.complete;
    if (null == _state) return widget.loading ?? Container();
    return widget.complete;
  }
}
