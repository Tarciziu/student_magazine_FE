import 'package:flutter/material.dart';
import 'package:practica_fe/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:practica_fe/widgets/navigation_bar/navigation_bar_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavigationBar extends StatefulWidget {
  NavigationBar({Key? key}) : super(key: key);

  final _NavigationBarState myState = _NavigationBarState();

  @override
  _NavigationBarState createState() => myState;
}

class _NavigationBarState extends State<NavigationBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("Build navbar");
    return ScreenTypeLayout(
      mobile: const NavigationBarMobile(),
      tablet: const NavigationBarMobile(),
      desktop: NavigationBarDesktop(),
    );
  }
}
