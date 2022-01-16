import 'package:flutter/material.dart';
import 'package:practica_fe/views/login/login_content_desktop.dart';
import 'package:practica_fe/views/login/login_content_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const LoginContentMobile(),
      tablet: const LoginContentDesktop(),
      desktop: const LoginContentDesktop(),
    );
  }
}
