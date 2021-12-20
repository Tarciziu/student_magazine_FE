import 'package:flutter/material.dart';
import 'package:practica_fe/datamodels/card_article_model.dart';
import 'package:practica_fe/extensions/hover_extensions.dart';
import 'package:practica_fe/utils/responsive_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SubjectPageDetails extends StatelessWidget {
  final String subject;
  final String subjectImage;

  SubjectPageDetails(
      {Key? key, required this.subject, required this.subjectImage})
      : super(key: key);

  List<CardArticleModel> list = [
    CardArticleModel(
      title: "Nouă descoperire",
      author: "Ion Amariei",
      navigationPath: 'navigationPath',
      text:
          "In this code, I am trying to make a list of buttons or tiles as buttons do not work well for me  at the very top of the page. Thus, when one is clicked it returns a value in the rest of the page.The issue is The tile here toke around more than half of the page which makes it looks inconsistent. I want to limit the height of the tile, I have tried putting them in a row and a container and it doesn't work. Any HELP will be appreciated.",
      imageUrl: "",
      publishedDate: "10/12/2021",
    ),
    CardArticleModel(
      title: 'Student la UBB, olimpic internațional',
      author: "George Țirian",
      navigationPath: 'navigationPath',
      text: "Aici ceva text scurt, nu tot textul",
      imageUrl:
          "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
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
      imageUrl:
          "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
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
      imageUrl:
          "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
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
      imageUrl:
          "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
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
      imageUrl:
          "https://media.istockphoto.com/photos/heap-of-wooden-numbers-on-blue-background-picture-id1292684021?b=1&k=20&m=1292684021&s=170667a&w=0&h=5-7WcFt5ibtORzehe4YnPSTZIgUiayWQ3ICRrOibazk=",
      publishedDate: "10/12/2021",
    ),
  ];

  _buildArticleTile(CardArticleModel card, MediaQueryData mediaQuery) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: Container(
        width: mediaQuery.size.width * 0.94,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          color: Colors.white70,
          elevation: 10,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: mediaQuery.size.width * 0.28,
                    maxHeight: mediaQuery.size.width * 0.28,
                  ),
                  child: Image.network(card.imageUrl != "" ? card.imageUrl : subjectImage,
                  fit: BoxFit.fill),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: mediaQuery.size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        card.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: mediaQuery.size.width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: Text(
                        firstFewWords(mediaQuery, card.text),
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ).blueShadowOnHover,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SizedBox(
          width: 600,
          child: ListView.builder(
            itemExtent: 200,
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              CardArticleModel card = list[index];
              return _buildArticleTile(card, mediaQuery);
            },
            shrinkWrap: true,
          ),
        );
      },
    );
  }
}
