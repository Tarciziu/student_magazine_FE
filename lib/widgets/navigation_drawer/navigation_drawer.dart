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

            NavBarItem(
              title: 'Acasă',
              navigationPath: HomeRoute,
            ),
            NavBarItem(
              title: 'Matematică',
              navigationPath: MathRoute,
            ),
            NavBarItem(
              title: 'Informatică',
              navigationPath: ComputerScienceRoute,
            ),
            NavBarItem(
              title: 'Istorie',
              navigationPath: HistoryRoute,
            ),
            NavBarItem(
              title: 'Despre',
              navigationPath: AboutRoute,
            ),
          ],
        ),
      ),
    );
  }
}
