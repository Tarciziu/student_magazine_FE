import 'package:flutter/material.dart';
import 'package:practica_fe/widgets/home_page//home_page_info.dart';

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        SizedBox(
          width: 60,
        ),
        HomeDetails(),
      ],
    );
  }
}
