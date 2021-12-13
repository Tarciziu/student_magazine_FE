import 'package:flutter/material.dart';
import 'package:practica_fe/datamodels/navbar_item_model.dart';

class NavBarItemTabletDesktop extends StatelessWidget {
  final NavBarItemModel model;
  const NavBarItemTabletDesktop({Key? key, required this.model}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      model.title,
      style: const TextStyle(fontSize: 18, color: Colors.white),
    );
  }

}