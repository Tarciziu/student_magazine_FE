import 'package:flutter/material.dart';
import 'package:practica_fe/constants/section_default_images.dart';
import 'package:practica_fe/views/about/about_view.dart';
import 'package:practica_fe/views/create_article/create_article_view.dart';
import 'package:practica_fe/views/home/home_view.dart';
import 'package:practica_fe/views/login/login_view.dart';
import 'package:practica_fe/views/register/register_view.dart';
import 'package:practica_fe/views/subject/subject_view.dart';

import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(const HomeView(), settings);
    case LoginRoute:
      return _getPageRoute(const LoginView(), settings);
    case RegisterRoute:
      return _getPageRoute(const RegisterView(), settings);
    case AboutRoute:
      return _getPageRoute(const AboutView(), settings);
    case MathRoute:
      return _getPageRoute(const SubjectView(subject: "math", subjectImage: mathUrl,), settings);
     case ComputerScienceRoute:
      return _getPageRoute(const SubjectView(subject: "computerScience", subjectImage: computerScienceUrl,), settings);
     case HistoryRoute:
      return _getPageRoute(const SubjectView(subject: "history", subjectImage: mathUrl,), settings);
    case CreateArticleRoute:
      return _getPageRoute(const CreateArticleView(), settings);
    default:
      return _getPageRoute(const HomeView(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String? routeName;
  _FadeRoute({required this.child, this.routeName})
      : super(
    settings: RouteSettings(name: routeName),
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    child,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
  );
}
