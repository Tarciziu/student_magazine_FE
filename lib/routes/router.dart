import 'package:flutter/material.dart';
import 'package:practica_fe/views/about/about_view.dart';
import 'package:practica_fe/views/home/home_view.dart';
import 'package:practica_fe/views/subject/subject_view.dart';

import 'route_names.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(const HomeView(), settings);
    case AboutRoute:
      return _getPageRoute(const AboutView(), settings);
    case MathRoute:
      return _getPageRoute(const SubjectView(subject: "math"), settings);
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