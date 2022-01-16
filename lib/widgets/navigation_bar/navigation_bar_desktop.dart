import 'package:flutter/material.dart';
import 'package:practica_fe/constants/app_colors.dart';
import 'package:practica_fe/routes/route_names.dart';
import 'package:practica_fe/widgets/navbar_item/navbar_item.dart';

class NavigationBarDesktop extends StatelessWidget {
  const NavigationBarDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      color: primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              SizedBox(
                width: 60,
              ),
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
              NavBarItem(
                title: 'Informatică',
                navigationPath: ComputerScienceRoute,
              ),
              SizedBox(
                width: 60,
              ),
              NavBarItem(
                title: 'Istorie',
                navigationPath: HistoryRoute,
              ),
              SizedBox(
                width: 60,
              ),
              NavBarItem(title: 'Despre', navigationPath: AboutRoute),
            ],
          ),
          Row(
            children: const [
              NavBarItem(
                title: 'Login',
                navigationPath: LoginRoute,
              ),
              SizedBox(
                width: 60,
              )
            ],
          )
        ],
      ),
    );
  }
}
