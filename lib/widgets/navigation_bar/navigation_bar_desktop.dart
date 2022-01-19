import 'package:flutter/material.dart';
import 'package:practica_fe/constants/app_colors.dart';
import 'package:practica_fe/main.dart';
import 'package:practica_fe/routes/route_names.dart';
import 'package:practica_fe/views/layout_template/layout_template.dart';
import 'package:practica_fe/widgets/navbar_item/navbar_item.dart';

class NavigationBarDesktop extends StatefulWidget {
  NavigationBarDesktop({Key? key}) : super(key: key);

  @override
  _NavigationBarDesktopState createState() => _NavigationBarDesktopState();
}

class _NavigationBarDesktopState extends State<NavigationBarDesktop> {

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
            children: GlobalData.logged == false
                ? [
              const NavBarItem(
                title: 'Login',
                navigationPath: LoginRoute,
              ),
              const SizedBox(
                width: 60,
              )
            ]
                : [
              TextButton(
                child: Text("Log out"),
                onPressed: () {
                  GlobalData.logged = false;
                  GlobalData.email = 'none';
                  navBar.MyState.refresh();
                },
              ),
              const SizedBox(
                width: 60,
              )
            ],
          )
        ],
      ),
    );
  }
}