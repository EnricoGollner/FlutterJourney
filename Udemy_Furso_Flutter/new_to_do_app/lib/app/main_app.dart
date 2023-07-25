import 'package:flutter/material.dart';
import 'package:new_to_do_app/app/pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "New to-do app",
      home: HomePage(),
    );
  }
}
