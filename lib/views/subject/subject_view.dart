import 'package:flutter/material.dart';
import 'package:practica_fe/widgets/subject_page/subject_page_info.dart';
import 'package:responsive_builder/responsive_builder.dart';


class SubjectView extends StatelessWidget {
  final String subject;
  final String subjectImage;
  const SubjectView({Key? key, required this.subject, required this.subjectImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: SubjectPageDetails(subject: subject, subjectImage: subjectImage), //SubjectContentDesktop(subject: subject),
      desktop: SubjectPageDetails(subject: subject, subjectImage: subjectImage),
    );
  }
}
