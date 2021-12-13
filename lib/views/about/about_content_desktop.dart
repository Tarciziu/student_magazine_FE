import 'package:flutter/material.dart';
import 'package:practica_fe/widgets/about_page/about_page_info.dart';

class AboutContentDesktop extends StatelessWidget {
  const AboutContentDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const <Widget>[
        SizedBox(
          width: 60,
        ),
        AboutDetails(),
      ],
    );
  }
}
