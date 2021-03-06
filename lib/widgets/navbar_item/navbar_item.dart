import 'package:flutter/material.dart';
import 'package:practica_fe/datamodels/navbar_item_model.dart';
import 'package:practica_fe/extensions/hover_extensions.dart';
import 'package:practica_fe/main.dart';
import 'package:practica_fe/services/navigation_service.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';
import 'navbar_item_desktop.dart';
import 'navbar_item_mobile.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(
      {Key? key, required this.title, required this.navigationPath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
    );
    return GestureDetector(
      onTap: () {
        // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
        // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
        SelectedData.section = navigationPath;
        locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Provider.value(
        value: model,
        child: ScreenTypeLayout(
          desktop: NavBarItemDesktop(
            model: model,
          ).showCursorOnHover.moveUpOnHover,
          tablet: NavBarItemMobile(
            model: model,
          ),
          mobile: NavBarItemMobile(
            model: model,
          ),
        ),
      ),
    );
  }
}
