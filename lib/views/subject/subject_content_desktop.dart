import 'package:flutter/material.dart';
import 'package:practica_fe/widgets/subject_page/subject_page_info.dart';

class SubjectContentDesktop extends StatelessWidget {
  final String subject;
  const SubjectContentDesktop({Key? key, required this.subject}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SubjectPageDetails(subject: subject),
      ],
    );
  }
}
