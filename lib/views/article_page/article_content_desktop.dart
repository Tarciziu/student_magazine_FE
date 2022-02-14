import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:practica_fe/constants/section_default_images.dart';
import 'package:practica_fe/main.dart';

import '../../datamodels/card_article_model.dart';
import '../../utils/api_caller.dart';

class ArticleContentDesktop extends StatefulWidget {
  const ArticleContentDesktop({Key? key}) : super(key: key);

  @override
  _ArticleContentDesktopState createState() => _ArticleContentDesktopState();
}

class _ArticleContentDesktopState extends State<ArticleContentDesktop> {
  CardArticleModel article = CardArticleModel(
      id: 0,
      title: 'title',
      author: 'author',
      navigationPath: 'navigationPath',
      text: 'text',
      imageUrl: 'imageUrl',
      publishedDate: 'publishedDate');

  @override
  Widget build(BuildContext context) {
    var selectedImage;
    var selectedSection;
    switch (SelectedData.section) {
      case 'computerScience':
        selectedImage = computerScienceUrl;
        selectedSection = 'Informatică';
        break;
      case 'math':
        selectedImage = mathUrl;
        selectedSection = 'Matematică';
        break;
      default:
        selectedImage = mathUrl;
        selectedSection = 'Istorie';
        break;
    }
    return ListView(
      padding: EdgeInsets.only(
        top: 20,
      ),
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 60,
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 600,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      child: Image.network(
                        selectedImage,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.person,
                              color: Colors.deepPurple,
                              size: 20,
                            ),
                            Text(
                              ' ' + article.author,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 35,
                            ),
                            Icon(
                              Icons.date_range,
                              color: Colors.deepPurple,
                            ),
                            Text(' ' + article.publishedDate),
                            SizedBox(
                              width: 245,
                            ),
                            Icon(
                              Icons.menu_book,
                              color: Colors.deepPurple,
                            ),
                            Text(' ' + selectedSection),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          indent: 40,
                          endIndent: 40,
                          thickness: 1,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 800,
                          child: Center(
                            child: Html(
                              data: article.text,
                              style: {
                                'html': Style(
                                  textAlign: TextAlign.center,
                                  fontSize: FontSize(15),
                                )
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Image.asset(
                'assets/images/test.png',
                width: 300,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Future<CardArticleModel?> fetchData(int id) async {
    var value = await Caller().getArticleById(id: id);
    return value;
  }

  @override
  void initState() {
    super.initState();

    fetchData(SelectedData.id).then((value) {
      setState(() {
        if (value != null) article = value;
        print(article);
      });
    });
  }
}
