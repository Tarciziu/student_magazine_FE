import 'package:flutter/material.dart';
import 'package:practica_fe/datamodels/card_article_model.dart';
import 'package:practica_fe/utils/responsive_helper.dart';

class SectionPageInfo extends StatefulWidget {
  final String subject;
  final String subjectImage;

  const SectionPageInfo(
      {Key? key, required this.subject, required this.subjectImage})
      : super(key: key);

  @override
  _SectionPageInfoState createState() => _SectionPageInfoState();
}

class _SectionPageInfoState extends State<SectionPageInfo> {
  List<CardArticleModel> _articles = [];

  @override
  void initState() {
    super.initState();
    _fetchArticles();
  }

  _fetchArticles() async {
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
    setState(() {
      _articles = list;
    });
  }

  _buildArticlesGrid(MediaQueryData mediaQuery) {
    List<GridTile> tiles = [];
    for (var article in _articles) {
      tiles.add(_buildArticleTile(article, mediaQuery));
    }
    return Padding(
      padding: responsivePadding(mediaQuery),
      child: GridView.count(
        crossAxisCount: responsiveNumGridTiles(mediaQuery),
        crossAxisSpacing: 30.0,
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        children: tiles,
      ),
    );
  }

  _buildArticleTile(CardArticleModel article, MediaQueryData mediaQuery) {
    return GridTile(
      child: GestureDetector(
        onTap: () {
          //TODO
        },
        child: Column(
          children: <Widget>[
            Container(
              height: responsiveImageHeight(mediaQuery),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                image: DecorationImage(
                  image: NetworkImage(article.imageUrl != "" ? article.imageUrl : widget.subjectImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              alignment: Alignment.center,
              height: responsiveTitleHeight(mediaQuery),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 1),
                    blurRadius: 6.0,
                  ),
                ],
              ),
              child: Text(
                article.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            const SizedBox(height: 15.0),
            _articles.isNotEmpty
                ? _buildArticlesGrid(mediaQuery)
                : const Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }
}
