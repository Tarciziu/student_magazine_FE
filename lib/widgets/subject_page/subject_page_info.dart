import 'package:flutter/material.dart';
import 'package:practica_fe/datamodels/card_article_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SubjectPageDetails extends StatelessWidget {
  final String subject;
  final String subjectImage;

  SubjectPageDetails({Key? key, required this.subject, required this.subjectImage}) : super(key: key);

  List<CardArticleModel> list = [
    CardArticleModel(
      title: "Nouă descoperire",
      author: "Ion Amariei",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: 'Student la UBB, olimpic internațional',
      author: "George Țirian",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: "Nouă descoperire",
      author: "Ion Amariei",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: 'Student la UBB, olimpic internațional',
      author: "George Țirian",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: "Nouă descoperire",
      author: "Ion Amariei",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: 'Student la UBB, olimpic internațional',
      author: "George Țirian",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: "Nouă descoperire",
      author: "Ion Amariei",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: 'Student la UBB, olimpic internațional',
      author: "George Țirian",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: "Nouă descoperire",
      author: "Ion Amariei",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: 'Student la UBB, olimpic internațional',
      author: "George Țirian",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl: "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
      publishedDate: "10/12/2021",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        var listSize = sizingInformation.deviceScreenType == DeviceScreenType.desktop
            ? 5 : 4;
        var textAlignment =
            sizingInformation.deviceScreenType == DeviceScreenType.desktop
                ? TextAlign.left
                : TextAlign.center;
        double titleSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 20
                : 30;

        double descriptionSize =
            sizingInformation.deviceScreenType == DeviceScreenType.mobile
                ? 12
                : 16;

        return SizedBox(
          width: 600,
          child: ListView.builder(
            itemCount: listSize,//list.length > 5 ? 5 : list.length,
            itemBuilder: (BuildContext context, int index) {
              CardArticleModel card = list[index];
              return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child:Card(
                child: Container(
                  width: 300,
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    leading: ConstrainedBox(
                        constraints:
                        const BoxConstraints(minWidth: 100, minHeight: 100),
                        child: Image.network(
                          card.imageUrl != ""? card.imageUrl: subjectImage,
                          width: 100,
                          height: 100,
                        )),
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
