import 'package:flutter/material.dart';
import 'package:hive_app/app/people/pages/people_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PeoplePage(),
    );
  }
}