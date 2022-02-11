import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'create_article_content_dekstop.dart';

class CreateArticleView extends StatelessWidget {
  const CreateArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: const CreateArticleContentDesktop(),
      tablet: const CreateArticleContentDesktop(),
      desktop: const CreateArticleContentDesktop(),
    );
  }
}
