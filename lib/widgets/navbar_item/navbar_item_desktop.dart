import 'package:flutter/material.dart';
import 'package:practica_fe/datamodels/navbar_item_model.dart';
import 'package:provider_architecture/_provider_widget.dart';

class NavBarItemTabletDesktop extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Text(
      model.title,
      style: const TextStyle(fontSize: 18),
    );
  }
}