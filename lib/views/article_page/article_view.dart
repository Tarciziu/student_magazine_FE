import 'package:flutter/material.dart';
import 'package:practica_fe/views/article_page/article_content_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: ArticleContentDesktop(),
      tablet: ArticleContentDesktop(),
      desktop: ArticleContentDesktop(),
    );
  }
}
