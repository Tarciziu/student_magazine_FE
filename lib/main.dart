import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:practica_fe/views/layout_template/layout_template.dart';

import 'locator.dart';

void main() async {
  FlutterSession().set('logged', false);
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Revista',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: const LayoutTemplate(),
    );
  }
}

class GlobalData {
  static String email = 'none';
  static bool logged = false;
}
