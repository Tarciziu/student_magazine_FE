import 'package:flutter/material.dart';
import 'package:practica_fe/datamodels/card_article_model.dart';
import 'package:practica_fe/utils/responsive_helper.dart';

class SectionPage extends StatefulWidget {
  final String section;

  const SectionPage({Key? key, required this.section}) : super(key: key);

  @override
  _SectionPageState createState() => _SectionPageState();
}

class _SectionPageState extends State<SectionPage> {
  List<CardArticleModel> _articles = [];

  @override
  void initState() {
    super.initState();
    //_fetchArticles();
  }

  _fetchArticles() async {
    List<CardArticleModel> articles = [
      CardArticleModel(
        title: "Nouă descoperire",
        author: "Ion Amariei",
        navigationPath: 'navigationPath',
        text: "Aici ceva text scurt, nu tot textul",
        imageUrl:
            "https://image.shutterstock.com/image-vector/math-horizontal-banner-presentation-website-260nw-1859813464.jpg",
        publishedDate: "10/12/2021",
      ),
      CardArticleModel(
        title: 'Student la UBB, olimpic internațional',
        author: "George Țirian",
        navigationPath: 'navigationPath',
        text: "Aici ceva text scurt, nu tot textul",
        imageUrl:
            "https://image.shutterstock.com/image-vector/math-horizontal-banner-presentation-website-260nw-1859813464.jpg",
        publishedDate: "10/12/2021",
      ),
    ];
    // await APIService().fetchArticlesBySection('technology');
    setState(() {
      _articles = articles;
    });
  }

  _buildArticlesGrid(MediaQueryData mediaQuery) {
    List<GridTile> tiles = [];
    _articles.forEach((article) {
      tiles.add(_buildArticleTile(article, mediaQuery));
    });
    return Padding(
      padding: responsivePadding(mediaQuery),
      child: GridView.count(
        crossAxisCount: responsiveNumGridTiles(mediaQuery),
        mainAxisSpacing: 30.0,
        crossAxisSpacing: 30.0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: tiles,
      ),
    );
  }

  _buildArticleTile(CardArticleModel article, MediaQueryData mediaQuery) {
    return GridTile(
      child: GestureDetector(
        onTap: () => {
          // TODO navigation path to see the content of the post
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
                  image: NetworkImage(article.imageUrl),
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
    _fetchArticles();
    return Scaffold(
        body: Expanded(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _buildArticlesGrid(mediaQuery);
        },
        itemCount: _articles.length,
      ),
    ));
  }
}
