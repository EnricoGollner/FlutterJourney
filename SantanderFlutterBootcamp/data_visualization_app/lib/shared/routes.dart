import 'package:data_visualization_app/pages/card_detail_page.dart';
import 'package:data_visualization_app/pages/home_page.dart';
import 'package:data_visualization_app/pages/register_page.dart';
import 'package:flutter/material.dart';

const String homePage = '/homePage';
const String registerPage = '/registerPage';
const String cardDetailPage = '/cardDetailPage';

Route<dynamic>? generateRoutes(RouteSettings settings) {
  dynamic argumentData;

  switch (settings.name) {
    case '/homePage':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case '/registerPage':
      return MaterialPageRoute(builder: (_) => const RegisterPage());
    case '/cardDetailPage':
      argumentData = settings.arguments;
      return MaterialPageRoute(builder: (_) => CardDetailPage(tagIndex: argumentData));
    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('No routes founded!'),
          ),
        ),
      );
  }
}
