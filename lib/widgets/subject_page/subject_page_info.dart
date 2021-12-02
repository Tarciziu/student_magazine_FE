import 'package:flutter/material.dart';
import 'package:practica_fe/datamodels/card_post_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SubjectPageDetails extends StatelessWidget {
  final String subject;

  SubjectPageDetails({Key? key, required this.subject}) : super(key: key);

  List<CardPostModel> list = [
    CardPostModel(
        title: "Nouă descoperire",
        author: "Ion Amariei",
        navigationPath: 'navigationPath',
        text: "Aici ceva text scurt, nu tot textul"),
    CardPostModel(
        title: 'Student la UBB, olimpic internațional',
        author: "George Țirian",
        navigationPath: 'navigationPath',
        text: "Aici ceva text scurt, nu tot textul"),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? TextAlign.left
                : TextAlign.center;
        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 20
                : 50;

        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 12
                : 16;

        return SizedBox(
          width: 600,
          child: ListView.builder(
            itemCount: list.length > 5 ? 5 : list.length,
            itemBuilder: (BuildContext context, int index) {
              CardPostModel card = list[index];
              return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child:Card(
                child: Container(
                  width: 300,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    minVerticalPadding: 20,
                    title: Text(
                      card.title,
                      style: TextStyle(
                        fontSize: titleSize,
                      ),
                      textAlign: textAlignment,
                    ),
                    subtitle: Text(
                      card.text,
                      style: TextStyle(fontSize: descriptionSize),
                      textAlign: textAlignment,
                    ),
                    onTap: () => {
                      // TODO navigation path to see the content of the post
                    },
                  ),
                ),
              ));
            },
            shrinkWrap: true,
          ),
        );
      },
    );
  }
}
