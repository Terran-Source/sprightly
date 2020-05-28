import 'package:flutter/material.dart';
import 'package:sprightly/core/widgets/starter_app.dart';

void mainer(String environment) {
  print("Environment: $environment");
  runApp(StarterApp(environment: environment));
}
