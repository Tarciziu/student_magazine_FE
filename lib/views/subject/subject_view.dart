import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'subject_content_desktop.dart';

class SubjectView extends StatelessWidget {
  final String subject;
  const SubjectView({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: SubjectContentDesktop(subject: subject),
      desktop: SubjectContentDesktop(subject: subject),
    );
  }
}
