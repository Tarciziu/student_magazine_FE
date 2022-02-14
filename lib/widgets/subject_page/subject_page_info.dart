import 'package:flutter/material.dart';
import 'package:practica_fe/datamodels/card_article_model.dart';
import 'package:practica_fe/extensions/hover_extensions.dart';
import 'package:practica_fe/main.dart';
import 'package:practica_fe/utils/api_caller.dart';
import 'package:practica_fe/utils/responsive_helper.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';
import '../../routes/route_names.dart';
import '../../services/navigation_service.dart';

class SubjectPageDetails extends StatefulWidget {
  final String subject;
  final String subjectImage;
  SubjectPageDetails(
      {Key? key, required this.subject, required this.subjectImage})
      : super(key: key);

  @override
  _SubjectPageDetailsState createState() => _SubjectPageDetailsState();
}

class _SubjectPageDetailsState extends State<SubjectPageDetails> {
  List<CardArticleModel> list = List<CardArticleModel>.empty();

  @override
  void initState() {
    super.initState();
    fetchData().then((value) => setState(() {
          list = value;
        }));
  }

  Future<List<CardArticleModel>> fetchData() async {
    var list = await Caller().getArticlesBySectionRequest(widget.subject);
    print(list);
    return list;
  }

  _buildArticleTile(CardArticleModel card, MediaQueryData mediaQuery) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: SizedBox(
        width: mediaQuery.size.width * 0.94,
        child: GestureDetector(
          onTap: () => {
            SelectedData.id = card.id,
            locator<NavigationService>().navigateTo(ViewArticle),
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            color: Colors.white,
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
                    child: Image.network(
                      card.imageUrl != "" ? card.imageUrl : widget.subjectImage,
                      fit: BoxFit.fill,
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: Colors.transparent,
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
                    Container(
                      color: Colors.transparent,
                      width: mediaQuery.size.width * 0.7,
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
        ),
      ).blueShadowOnHover.showCursorOnHover,
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
