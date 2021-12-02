import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import 'package:practica_fe/datamodels/navbar_item_model.dart';

class NavBarItemMobile extends ProviderWidget<NavBarItemModel> {
  NavBarItemMobile({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 30,
          ),
          Text(
            model.title,
            style: const TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
