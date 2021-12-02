import 'package:flutter/material.dart';
import 'package:practica_fe/views/about/about_content_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AboutView extends StatelessWidget {
  const AboutView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: const AboutContentDesktop(),
      mobile: const AboutContentDesktop(),
    );
  }
}
