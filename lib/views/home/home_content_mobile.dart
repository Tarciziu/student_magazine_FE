import 'package:flutter/material.dart';
import 'package:practica_fe/widgets/course_details/home_page_info.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        CourseDetails(),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
