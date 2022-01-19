import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'register_content_desktop.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: RegisterContentDesktop(),
      //tablet: RegisterContentDesktop(),
      desktop: RegisterContentDesktop(),
    );
  }
}
