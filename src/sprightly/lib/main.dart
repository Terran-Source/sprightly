import 'package:flutter/material.dart';
import 'package:sprightly/core/widgets/starter_app.dart';

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  final environment = null != args && args.length > 0 ? args[0] : null;
  print("Environment: $environment");
  runApp(StarterApp(environment: environment));
}
