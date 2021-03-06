import 'package:flutter/material.dart';
import 'package:practica_fe/routes/route_names.dart';
import 'package:practica_fe/routes/router.dart';
import 'package:practica_fe/services/navigation_service.dart';
import 'package:practica_fe/widgets/navigation_bar/navigation_bar.dart'
    as NavBar;
import 'package:practica_fe/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';

var navBar = NavBar.NavigationBar();

class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: MediaQuery.of(context).size.width <1100 ? const NavigationDrawer():null,
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            navBar,
            Expanded(
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: HomeRoute,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
