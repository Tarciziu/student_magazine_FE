import 'package:flutter/material.dart';
import 'package:practica_fe/views/profile/profile_content_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ProfileContentDesktop(),
      tablet: ProfileContentDesktop(),
      desktop: ProfileContentDesktop(),
    );
  }
}
