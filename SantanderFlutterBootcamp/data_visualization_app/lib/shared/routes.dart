import 'package:data_visualization_app/pages/home_page.dart';
import 'package:data_visualization_app/pages/register_page.dart';
import 'package:flutter/material.dart';

const String homePage = '/homePage';
const String registerPage = '/registerPage';

Route<dynamic>? generateRoutes(settings) {
  switch (settings.name) {
    case '/homePage':
      return MaterialPageRoute(builder: (_) => const HomePage());
    case '/registerPage':
      return MaterialPageRoute(builder: (_) => const RegisterPage());
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text('No routes founded'),
                ),
        ),
      );
  }
}
