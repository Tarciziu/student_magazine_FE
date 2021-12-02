import 'package:flutter/material.dart';
import 'package:practica_fe/routes/route_names.dart';
import 'package:practica_fe/widgets/navbar_item/navbar_item.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              NavBarItem(
                title: 'Acasă',
                navigationPath: HomeRoute,
              ),
              SizedBox(
                width: 60,
              ),
              NavBarItem(
                title: 'Matematică',
                navigationPath: MathRoute,
              ),
              SizedBox(
                width: 60,
              ),
              NavBarItem(title: 'About', navigationPath: AboutRoute),
            ],
          )
        ],
      ),
    );
  }
}
