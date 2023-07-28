import 'package:flutter/material.dart';
import 'package:to_do_app/app/pages/home_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-do App',
      home: HomePage(),
    );
  }
}
