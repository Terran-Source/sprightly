import 'package:flutter/material.dart';
import 'package:sprightly/core/initiate.dart';
import 'package:sprightly/core/widgets/starter_page.dart';
import 'package:sprightly/core/widgets/stateful_wrapper.dart';

class StarterApp extends StatelessWidget {
  final String environment;

  const StarterApp({Key key, this.environment}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StatefulWrapper(
      onInit: () async =>
          null == environment ? await initiate() : await initiate(environment),
      loading: getMaterialApp, // now optional
      complete: getMaterialApp,
    );
  }
}

MaterialApp get getMaterialApp => MaterialApp(
      title: 'Sprightly',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StarterPage(title: 'Sprightly Home Page'),
    );
