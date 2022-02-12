import 'package:flutter/material.dart';
import 'package:practica_fe/views/layout_template/layout_template.dart';

import 'locator.dart';

void main() async {
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
  static String firstName = 'none';
  static String lastName = 'none';
  static bool logged = false;
  static String role = '';
}

class SelectedData {
  static String section = 'none';
  static int id = 1;
}
