import 'package:data_visualization_app/pages/register_page.dart';
import 'package:data_visualization_app/shared/routes.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoutes,
      home: RegisterPage(),
    );
  }
}