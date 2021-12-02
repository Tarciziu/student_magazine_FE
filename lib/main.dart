import 'package:flutter/material.dart';
import 'package:practica_fe/routes/route_names.dart';
import 'package:practica_fe/routes/router.dart';
import 'package:practica_fe/services/navigation_service.dart';
import 'package:practica_fe/views/home/home_view.dart';
import 'package:practica_fe/views/layout_template/layout_template.dart';
import 'package:practica_fe/widgets/centered_view/centered_view.dart';
import 'package:practica_fe/widgets/navigation_bar/navigation_bar.dart';
import 'package:practica_fe/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Revista',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      home: const LayoutTemplate(),
    );
  }
}