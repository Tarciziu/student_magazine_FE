import 'package:flutter/material.dart';
import 'package:practica_fe/routes/route_names.dart';
import 'package:practica_fe/widgets/navbar_item/navbar_item.dart';
import 'package:practica_fe/widgets/navigation_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(0,0,0,0),
        child: ListView(
          children: const <Widget>[
            NavigationDrawerHeader(),
            // BONUS: Combine the UI for this widget with the NavBarItem and make it responsive.
            // The UI for the current DrawerItem shows when it's in mobile, else it shows the NavBarItem ui.
            NavBarItem(
              title: 'Math',
              navigationPath: MathRoute,
            ),
            NavBarItem(
              title: 'ComputerScience',
              navigationPath: ComputerScienceRoute,
            ),
            NavBarItem(
              title: 'History',
              navigationPath: HistoryRoute,
            ),
            NavBarItem(
              title: 'About',
              navigationPath: AboutRoute,
            ),
          ],
        ),
      ),
    );
  }
}
