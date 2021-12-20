import 'package:flutter/material.dart';
import 'package:practica_fe/widgets/about_page/about_page_info.dart';

class AboutContentMobile extends StatelessWidget {
  const AboutContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        AboutDetails(),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
